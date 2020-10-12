; ModuleID = 'glob.bc'
source_filename = "glob.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common dso_local global i32 0, align 4, !dbg !0
@b = common dso_local global i32 0, align 4, !dbg !6
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @glob_comp() #0 !dbg !13 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @a, align 4, !dbg !16
  %1 = load i32, i32* @b, align 4, !dbg !18
  %cmp = icmp sgt i32 %0, %1, !dbg !19
  br i1 %cmp, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !22
  br label %return, !dbg !22

return:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !23
  ret i32 %2, !dbg !23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !24 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @klee_make_symbolic(i8* bitcast (i32* @a to i8*), i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !25
  call void @klee_make_symbolic(i8* bitcast (i32* @b to i8*), i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !26
  %call = call i32 @glob_comp(), !dbg !27
  ret i32 %call, !dbg !28
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "glob.c", directory: "/home/klee/share")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!13 = distinct !DISubprogram(name: "glob_comp", scope: !3, file: !3, line: 6, type: !14, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocation(line: 8, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !13, file: !3, line: 8, column: 5)
!18 = !DILocation(line: 8, column: 9, scope: !17)
!19 = !DILocation(line: 8, column: 7, scope: !17)
!20 = !DILocation(line: 8, column: 5, scope: !13)
!21 = !DILocation(line: 8, column: 12, scope: !17)
!22 = !DILocation(line: 9, column: 7, scope: !17)
!23 = !DILocation(line: 10, column: 1, scope: !13)
!24 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !14, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DILocation(line: 14, column: 2, scope: !24)
!26 = !DILocation(line: 15, column: 2, scope: !24)
!27 = !DILocation(line: 16, column: 9, scope: !24)
!28 = !DILocation(line: 16, column: 2, scope: !24)
