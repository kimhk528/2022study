use strict;
use warnings;

print "Hello World";

my $undef = undef;
print $undef; # 경고(warning)가 발생하며 빈 문자열("")을 출력한다.

# 묵시적인 undef
my $undef2;
print $undef2; # 위와 같은 경고 출력

my $num = 4040.5;
print $num; # "4040.5"

my $string = "world";
print $string; # "world"