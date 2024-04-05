; ModuleID = 'probe3.7ec0c58fa5232b80-cgu.0'
source_filename = "probe3.7ec0c58fa5232b80-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-none-unknown-eabihf"

; probe3::probe
; Function Attrs: nounwind
define dso_local void @_ZN6probe35probe17hcbede292156dce52E() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 -2147483648, ptr %0, align 4
  %_0.i = load i32, ptr %0, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bitreverse.i32(i32) #1

attributes #0 = { nounwind "frame-pointer"="all" "target-cpu"="generic" "target-features"="+vfp4,-d32,-fp64" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.79.0-nightly (4fd4797c2 2024-04-03)"}
