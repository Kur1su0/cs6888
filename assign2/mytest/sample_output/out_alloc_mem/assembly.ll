; ModuleID = 'alloc_mem.bc'
source_filename = "alloc_mem.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @call_malloc(i32 %n) #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %ptr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %ptr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32* null, i32** %ptr, align 8, !dbg !17
  %0 = load i32, i32* %n.addr, align 4, !dbg !18
  %conv = sext i32 %0 to i64, !dbg !18
  %mul = mul i64 %conv, 4, !dbg !19
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !20
  %1 = bitcast i8* %call to i32*, !dbg !21
  store i32* %1, i32** %ptr, align 8, !dbg !22
  %2 = load i32*, i32** %ptr, align 8, !dbg !23
  %cmp = icmp eq i32* %2, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %if.else
  %3 = load i32, i32* %i, align 4, !dbg !34
  %4 = load i32, i32* %n.addr, align 4, !dbg !36
  %cmp2 = icmp slt i32 %3, %4, !dbg !37
  br i1 %cmp2, label %for.body, label %if.end25, !dbg !38

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !39
  %cmp4 = icmp ne i32 %5, 0, !dbg !42
  br i1 %cmp4, label %land.lhs.true, label %if.else9, !dbg !43

land.lhs.true:                                    ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !44
  %rem = srem i32 %6, 2, !dbg !45
  %cmp6 = icmp eq i32 %rem, 0, !dbg !46
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !47

if.then8:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %i, align 4, !dbg !48
  %8 = load i32, i32* %n.addr, align 4, !dbg !49
  %add = add nsw i32 %7, %8, !dbg !50
  %9 = load i32*, i32** %ptr, align 8, !dbg !51
  %10 = load i32, i32* %i, align 4, !dbg !52
  %idxprom = sext i32 %10 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !51
  store i32 %add, i32* %arrayidx, align 4, !dbg !53
  br label %for.inc, !dbg !51

if.else9:                                         ; preds = %land.lhs.true, %for.body
  %11 = load i32, i32* %i, align 4, !dbg !54
  %cmp10 = icmp ne i32 %11, 0, !dbg !56
  br i1 %cmp10, label %land.lhs.true12, label %if.else21, !dbg !57

land.lhs.true12:                                  ; preds = %if.else9
  %12 = load i32, i32* %i, align 4, !dbg !58
  %rem13 = srem i32 %12, 3, !dbg !59
  %cmp14 = icmp eq i32 %rem13, 0, !dbg !60
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !61

if.then16:                                        ; preds = %land.lhs.true12
  %13 = load i32, i32* %i, align 4, !dbg !62
  %14 = load i32, i32* %n.addr, align 4, !dbg !63
  %mul17 = mul nsw i32 3, %14, !dbg !64
  %add18 = add nsw i32 %13, %mul17, !dbg !65
  %15 = load i32*, i32** %ptr, align 8, !dbg !66
  %16 = load i32, i32* %i, align 4, !dbg !67
  %idxprom19 = sext i32 %16 to i64, !dbg !66
  %arrayidx20 = getelementptr inbounds i32, i32* %15, i64 %idxprom19, !dbg !66
  store i32 %add18, i32* %arrayidx20, align 4, !dbg !68
  br label %for.inc, !dbg !66

if.else21:                                        ; preds = %land.lhs.true12, %if.else9
  %17 = load i32, i32* %i, align 4, !dbg !69
  %18 = load i32*, i32** %ptr, align 8, !dbg !70
  %19 = load i32, i32* %i, align 4, !dbg !71
  %idxprom22 = sext i32 %19 to i64, !dbg !70
  %arrayidx23 = getelementptr inbounds i32, i32* %18, i64 %idxprom22, !dbg !70
  store i32 %17, i32* %arrayidx23, align 4, !dbg !72
  br label %for.inc

for.inc:                                          ; preds = %if.then8, %if.else21, %if.then16
  %20 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %20, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

if.end25:                                         ; preds = %for.cond
  %21 = load i32*, i32** %ptr, align 8, !dbg !77
  %22 = bitcast i32* %21 to i8*, !dbg !77
  call void @free(i8* %22) #4, !dbg !78
  store i32* null, i32** %ptr, align 8, !dbg !79
  store i32 1, i32* %retval, align 4, !dbg !80
  br label %return, !dbg !80

return:                                           ; preds = %if.end25, %if.then
  %23 = load i32, i32* %retval, align 4, !dbg !81
  ret i32 %23, !dbg !81
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = bitcast i32* %n to i8*, !dbg !87
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !88
  %1 = load i32, i32* %n, align 4, !dbg !89
  %call = call i32 @call_malloc(i32 %1), !dbg !90
  ret i32 %call, !dbg !91
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, nameTableKind: None)
!1 = !DIFile(filename: "alloc_mem.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!11 = distinct !DISubprogram(name: "call_malloc", scope: !1, file: !1, line: 5, type: !12, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!5, !5}
!14 = !DILocalVariable(name: "n", arg: 1, scope: !11, file: !1, line: 5, type: !5)
!15 = !DILocation(line: 5, column: 21, scope: !11)
!16 = !DILocalVariable(name: "ptr", scope: !11, file: !1, line: 6, type: !4)
!17 = !DILocation(line: 6, column: 10, scope: !11)
!18 = !DILocation(line: 7, column: 24, scope: !11)
!19 = !DILocation(line: 7, column: 25, scope: !11)
!20 = !DILocation(line: 7, column: 17, scope: !11)
!21 = !DILocation(line: 7, column: 11, scope: !11)
!22 = !DILocation(line: 7, column: 9, scope: !11)
!23 = !DILocation(line: 8, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !1, line: 8, column: 8)
!25 = !DILocation(line: 8, column: 11, scope: !24)
!26 = !DILocation(line: 8, column: 8, scope: !11)
!27 = !DILocation(line: 9, column: 6, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 8, column: 18)
!29 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 11, type: !5)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 11, column: 9)
!31 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 10)
!32 = !DILocation(line: 11, column: 17, scope: !30)
!33 = !DILocation(line: 11, column: 13, scope: !30)
!34 = !DILocation(line: 11, column: 22, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !1, line: 11, column: 9)
!36 = !DILocation(line: 11, column: 24, scope: !35)
!37 = !DILocation(line: 11, column: 23, scope: !35)
!38 = !DILocation(line: 11, column: 9, scope: !30)
!39 = !DILocation(line: 12, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 12, column: 16)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 11, column: 31)
!42 = !DILocation(line: 12, column: 17, scope: !40)
!43 = !DILocation(line: 12, column: 21, scope: !40)
!44 = !DILocation(line: 12, column: 24, scope: !40)
!45 = !DILocation(line: 12, column: 25, scope: !40)
!46 = !DILocation(line: 12, column: 27, scope: !40)
!47 = !DILocation(line: 12, column: 16, scope: !41)
!48 = !DILocation(line: 12, column: 39, scope: !40)
!49 = !DILocation(line: 12, column: 41, scope: !40)
!50 = !DILocation(line: 12, column: 40, scope: !40)
!51 = !DILocation(line: 12, column: 32, scope: !40)
!52 = !DILocation(line: 12, column: 36, scope: !40)
!53 = !DILocation(line: 12, column: 38, scope: !40)
!54 = !DILocation(line: 13, column: 14, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !1, line: 13, column: 14)
!56 = !DILocation(line: 13, column: 15, scope: !55)
!57 = !DILocation(line: 13, column: 19, scope: !55)
!58 = !DILocation(line: 13, column: 22, scope: !55)
!59 = !DILocation(line: 13, column: 23, scope: !55)
!60 = !DILocation(line: 13, column: 25, scope: !55)
!61 = !DILocation(line: 13, column: 14, scope: !40)
!62 = !DILocation(line: 13, column: 36, scope: !55)
!63 = !DILocation(line: 13, column: 40, scope: !55)
!64 = !DILocation(line: 13, column: 39, scope: !55)
!65 = !DILocation(line: 13, column: 37, scope: !55)
!66 = !DILocation(line: 13, column: 29, scope: !55)
!67 = !DILocation(line: 13, column: 33, scope: !55)
!68 = !DILocation(line: 13, column: 35, scope: !55)
!69 = !DILocation(line: 14, column: 18, scope: !55)
!70 = !DILocation(line: 14, column: 11, scope: !55)
!71 = !DILocation(line: 14, column: 15, scope: !55)
!72 = !DILocation(line: 14, column: 17, scope: !55)
!73 = !DILocation(line: 11, column: 28, scope: !35)
!74 = !DILocation(line: 11, column: 9, scope: !35)
!75 = distinct !{!75, !38, !76}
!76 = !DILocation(line: 15, column: 2, scope: !30)
!77 = !DILocation(line: 17, column: 10, scope: !11)
!78 = !DILocation(line: 17, column: 5, scope: !11)
!79 = !DILocation(line: 18, column: 8, scope: !11)
!80 = !DILocation(line: 19, column: 5, scope: !11)
!81 = !DILocation(line: 21, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !83, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!5}
!85 = !DILocalVariable(name: "n", scope: !82, file: !1, line: 25, type: !5)
!86 = !DILocation(line: 25, column: 6, scope: !82)
!87 = !DILocation(line: 27, column: 21, scope: !82)
!88 = !DILocation(line: 27, column: 2, scope: !82)
!89 = !DILocation(line: 31, column: 21, scope: !82)
!90 = !DILocation(line: 31, column: 9, scope: !82)
!91 = !DILocation(line: 31, column: 2, scope: !82)
