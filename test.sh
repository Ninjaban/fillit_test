echo "START\n"
echo "ERROR TEST:\n"
cat error0 | less
$1 error0 | less

cat error1 | less
$1 error1 | less

cat error2 | less
$1 error2 | less

cat error3 | less
$1 error3 | less

cat error4 | less
$1 error4 | less

cat error5 | less
$1 error5 | less

cat error6 | less
$1 error6 | less

cat error7 | less
$1 error7 | less
echo "BASIC TEST:\n"
cat file0 | less
$1 file0 | less

cat file1 | less
$1 file1 | less

cat file2 | less
$1 file2 | less

cat file3 | less
$1 file3 | less
echo "TIME TEST:\n"
cat file4 | less
time $1 file4 | less

cat file5 | less
time $1 file5 | less
echo "END\n"