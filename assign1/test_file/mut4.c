#<tcclib.h>
int printf (const char *, ...);
struct {
int f0;
int f1;
int f2;
}
a, b = {
0, 0, 1
};
void
fn1 () {
a = b;
a = a;
}
int
main () {
fn1 ();
printf ("%d\n", a.f2);
return 0;
}

