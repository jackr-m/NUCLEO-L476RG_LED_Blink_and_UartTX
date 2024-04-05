#![no_std]
#![no_main]
#![feature(type_alias_impl_trait)]

// use defmt::*;
use core::fmt::Write;
use heapless::String;
use embassy_executor::Spawner;
use embassy_stm32::gpio::{Level, Output, Speed};
use embassy_time::Timer;
// use embassy_stm32::dma::NoDma;
use embassy_stm32::usart::{Config, UartTx};
// use embassy_stm32::time::Hertz;

//noinspection RsUnusedImport
use {defmt_rtt as _, panic_probe as _};


#[embassy_executor::main]
/// Main function, blinks an LED for 200ms on, 300ms off, and prints the current loop number to the console.
async fn main(_spawner: Spawner) {
    // Hardware objects
    let p = embassy_stm32::init(Default::default());
    let mut usart = UartTx::new(p.USART2, p.PA2, p.DMA1_CH6, Config::default()).unwrap();
    let mut led = Output::new(p.PA5, Level::High, Speed::Low); // Define LED pin

    // Variables
    let mut loop_counter: u16 = 0; // Create loop counter
    const MAX_STRING_LENGTH: usize = "LED has blinked  times".len() + 5; // Define max string length
    let mut msg: String<MAX_STRING_LENGTH> = String::new(); // Create blank string for UART print
    
    // info!("Starting LED Blinking..."); // debug way to do it
    // core::writeln!(&mut msg, "Starting LED Blinking...").unwrap();
    msg.push_str("Starting LED Blinking...\n").unwrap();
    // usart.blocking_write(msg.as_bytes()).unwrap();
    
    loop {
        led.set_high();
        // info!("LED Has Blinked {} times", loop_counter); // debug way to do it
        let remaining_capacity = msg.capacity() - msg.len();
        if remaining_capacity >= MAX_STRING_LENGTH {
            core::writeln!(&mut msg, "LED has blinked {} times", loop_counter).unwrap();
            usart.blocking_write(msg.as_bytes()).unwrap();
        }
        
        Timer::after_millis(200).await;
        led.set_low();
        Timer::after_millis(300).await;
        loop_counter = loop_counter.wrapping_add(1); // use a wrapping add to avoid panics during overflow
    }
}