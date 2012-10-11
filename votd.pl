#!/usr/bin/perl -w
#Recieves two arguments, argument 0 is the verse reference and 1 is the verse string
#html for the verse of the day is always the same. 

my $str = $ARGV[1];
my $verse = substr($ARGV[0],10,length($ARGV[0]));
$verse = substr($verse,0,length($verse)-8);

if (defined $str) {
  $str = substr(substr($str, 0, (length($str)-20)), 40);
  #Replace HTML codes with acceptable characters for the terminal
  $str =~ s/&#821(6|7);/\'/g;#left and right single quotes 
  $str =~ s/&#821(1|2);/--/g;#en and em dash 
  $str =~ s/&#822(0|1);/\"/g;#left and right double quotes 
}

print "Verse of the Day: ".$str."\n  ".$verse."\n";
