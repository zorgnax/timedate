use strict;
use warnings;
use lib "lib";
use Test::More;
use TimeDate;

$ENV{TZ} = "Asia/Ashgabat";
my $t = TimeDate->new("2015-09-14 11:44 am");
ok $t->{epoch} == 1442213040, "parse time";
ok "$t" eq "2015-09-14 11:44:00", "stringify back";
$ENV{TZ} = "Pacific/Rarotonga";
ok "$t" eq "2015-09-13 20:44:00", "different timezone";
$t = TimeDate->now;
ok $t->{epoch} > 1442255468, "now";
$t = TimeDate->new_epoch(1442255468);
ok "$t" eq "2015-09-14 08:31:08", "new_epoch";
my $zones = TimeDate->time_zones;
ok ref $zones eq "ARRAY", "time_zones";

done_testing;

