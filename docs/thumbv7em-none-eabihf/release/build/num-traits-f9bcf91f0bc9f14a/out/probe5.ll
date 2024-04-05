; ModuleID = 'probe5.128cbd05d4445372-cgu.0'
source_filename = "probe5.128cbd05d4445372-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-none-unknown-eabihf"

@alloc_e6758488a51c40069ade2309416f0500 = private unnamed_addr constant <{ [6 x i8] }> <{ [6 x i8] c"<anon>" }>, align 1
@alloc_d12c14f11e3139b652d3fa6b88676ab4 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_e6758488a51c40069ade2309416f0500, [12 x i8] c"\06\00\00\00\02\00\00\00\1F\00\00\00" }>, align 4

; probe5::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe55probe17h3da470d642813c0bE() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h01f7fdccf78acb24E.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic_const::panic_const_div_by_zero
  call void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17h5cff520a5d434f88E(ptr align 4 @alloc_d12c14f11e3139b652d3fa6b88676ab4) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h01f7fdccf78acb24E.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic_const::panic_const_div_by_zero
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17h5cff520a5d434f88E(ptr align 4) unnamed_addr #2

attributes #0 = { nounwind "frame-pointer"="all" "target-cpu"="generic" "target-features"="+vfp4,-d32,-fp64" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { cold noinline noreturn nounwind "frame-pointer"="all" "target-cpu"="generic" "target-features"="+vfp4,-d32,-fp64" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.79.0-nightly (4fd4797c2 2024-04-03)"}
