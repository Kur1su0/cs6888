; ModuleID = 'arg.bc'
source_filename = "arg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %n, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 4, i32* %n, align 4, !dbg !19
  %0 = bitcast i32* %n to i8*, !dbg !20
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !22
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !22
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 0, !dbg !22
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !22
  %conv = sext i8 %3 to i32, !dbg !22
  %sub = sub nsw i32 %conv, 48, !dbg !24
  %4 = load i32, i32* %n, align 4, !dbg !25
  %cmp = icmp sgt i32 %sub, %4, !dbg !26
  br i1 %cmp, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !28
  br label %return, !dbg !28

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !29
  br label %return, !dbg !29

return:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !30
  ret i32 %5, !dbg !30
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "arg.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 26, scope: !7)
!18 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 7, column: 6, scope: !7)
!20 = !DILocation(line: 8, column: 21, scope: !7)
!21 = !DILocation(line: 8, column: 2, scope: !7)
!22 = !DILocation(line: 9, column: 13, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 12)
!24 = !DILocation(line: 9, column: 24, scope: !23)
!25 = !DILocation(line: 9, column: 33, scope: !23)
!26 = !DILocation(line: 9, column: 31, scope: !23)
!27 = !DILocation(line: 9, column: 12, scope: !7)
!28 = !DILocation(line: 9, column: 37, scope: !23)
!29 = !DILocation(line: 10, column: 7, scope: !23)
!30 = !DILocation(line: 13, column: 1, scope: !7)
