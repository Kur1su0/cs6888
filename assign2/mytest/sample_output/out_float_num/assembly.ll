; ModuleID = 'float_num.bc'
source_filename = "float_num.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_float(float %a) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr, metadata !12, metadata !DIExpression()), !dbg !13
  %0 = load float, float* %a.addr, align 4, !dbg !14
  %conv = fpext float %0 to double, !dbg !14
  %cmp = fcmp ogt double %conv, 3.140000e+00, !dbg !16
  br i1 %cmp, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !18
  br label %return, !dbg !18

if.else:                                          ; preds = %entry
  %1 = load float, float* %a.addr, align 4, !dbg !19
  %conv2 = fpext float %1 to double, !dbg !19
  %cmp3 = fcmp oeq double %conv2, 3.140000e+00, !dbg !21
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !22

if.then5:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

if.else6:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !24
  br label %return, !dbg !24

return:                                           ; preds = %if.else6, %if.then5, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !25
  ret i32 %2, !dbg !25
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  %a = alloca float, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata float* %a, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = bitcast float* %a to i8*, !dbg !31
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !32
  %1 = load float, float* %a, align 4, !dbg !33
  %call = call i32 @_float(float %1), !dbg !34
  ret i32 %call, !dbg !35
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "float_num.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!7 = distinct !DISubprogram(name: "_float", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!13 = !DILocation(line: 4, column: 18, scope: !7)
!14 = !DILocation(line: 5, column: 6, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 6)
!16 = !DILocation(line: 5, column: 7, scope: !15)
!17 = !DILocation(line: 5, column: 6, scope: !7)
!18 = !DILocation(line: 5, column: 14, scope: !15)
!19 = !DILocation(line: 6, column: 10, scope: !20)
!20 = distinct !DILexicalBlock(scope: !15, file: !1, line: 6, column: 10)
!21 = !DILocation(line: 6, column: 12, scope: !20)
!22 = !DILocation(line: 6, column: 10, scope: !15)
!23 = !DILocation(line: 6, column: 21, scope: !20)
!24 = !DILocation(line: 7, column: 7, scope: !20)
!25 = !DILocation(line: 9, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !27, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!10}
!29 = !DILocalVariable(name: "a", scope: !26, file: !1, line: 13, type: !11)
!30 = !DILocation(line: 13, column: 8, scope: !26)
!31 = !DILocation(line: 14, column: 21, scope: !26)
!32 = !DILocation(line: 14, column: 2, scope: !26)
!33 = !DILocation(line: 16, column: 16, scope: !26)
!34 = !DILocation(line: 16, column: 9, scope: !26)
!35 = !DILocation(line: 16, column: 2, scope: !26)
