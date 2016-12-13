echo "START\n"
echo "ERROR TEST:\n"
cat error0
$1 error0
echo "\n"
cat error1
$1 error1
echo "\n"
cat error2
$1 error2
echo "\n"
cat error3
$1 error3
echo "\n"
cat error4
$1 error4
echo "\n"
cat error5
$1 error5
echo "\n"
cat error6
$1 error6
echo "\n"
cat error7
$1 error7
echo "\n"
echo "BASIC TEST:\n"
cat file0
$1 file0
echo "\n"
cat file1
$1 file1
echo "\n"
cat file2
$1 file2
echo "\n"
cat file3
$1 file3
echo "\n"
echo "TIME TEST:\n"
cat file4
time $1 file4
echo "\n"
cat file5
time $1 file5
echo "\n"
echo "END\n"