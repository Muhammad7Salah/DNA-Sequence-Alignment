#!perl

use warnings;
use strict;


my @array;
my $sequences = <STDIN>;
chomp ($sequences);
open STDIN, "<$sequences" or die "Fein el-sequence el-awalany da yabni ?\n";

my @sequence1;
my @sequence2;
my $line;
my $count=0;
my $match = 5;
my $miss = -4;
my $gap = -5;
while (defined ($line = <STDIN>)){
	chomp ($line);
	push @array,$line;
	
	$count++;
	if($count==2){
		last;
		}
	}
		$sequence1[0]="";
		$sequence2[0]="";
	for(my $i=1;$i<=length($array[0]);$i++){
		
		$sequence1[$i]=substr($array[0],$i-1,1);
		
		}
		
	for(my $i=1;$i<=length($array[1]);$i++){
		
		$sequence2[$i]=substr($array[1],$i-1,1);
		
		}

my @matrixValues;
my %hash;

#index 0 for i
$matrixValues [0][0][0] = 0;
#index 1 for j
$matrixValues [0][0][1] = 0;
#index 2 for score
$matrixValues [0][0][2] = 0;

my $d=0;
my $h=0;
my $v=0;

for(my $i=0;$i<@sequence1;$i++){ #vertical
	for(my $j=0;$j<@sequence2;$j++){ #horizontal
		
		if($i==0 and $j==0){
			# print $i . "\t". $j . "\n";
			 # print $matrixValues [$i][$j][0]."\t";
			 # print $matrixValues [$i][$j][1]."\t";
			 # print $matrixValues [$i][$j][2]."\n";
			next;
			}
		elsif($i==0){
			
			$matrixValues [$i][$j][0]=$i;
			$matrixValues [$i][$j][1]=$j-1;
			$matrixValues [$i][$j][2]=$matrixValues [$i][$j-1][2]+$gap;
			
			# print $i . "\t". $j . "\n";
			 # print $matrixValues [$i][$j][0]."\t";
			 # print $matrixValues [$i][$j][1]."\t";
			 # print $matrixValues [$i][$j][2]."\n";
			 
			}
		elsif($j==0){
			
			$matrixValues [$i][$j][0]=$i-1;
			$matrixValues [$i][$j][1]=$j;
			$matrixValues [$i][$j][2]=$matrixValues [$i-1][$j][2]+$gap;
			
			# print $i . "\t". $j . "\n";
			 # print $matrixValues [$i][$j][0]."\t";
			 # print $matrixValues [$i][$j][1]."\t";
			 # print $matrixValues [$i][$j][2]."\n";
			
			}
		else {
		
			$h=$matrixValues [$i][$j-1][2]+$gap; 
			$v=$matrixValues [$i-1][$j][2]+$gap; 
		
		if($sequence1[$i] eq $sequence2[$j]){
			
			$d= $matrixValues [$i-1][$j-1][2]+$match; 
			
			}
		else{
						
			$d= $matrixValues [$i-1][$j-1][2]+$miss;
			
			}
			
		# if($i==52 and $j==54){
			# print $matrixValues [$i-1][$j-1][2]."\n";
			# print $d."\n".$v."\n".$h."\n";
			
			# }
			
		if($h>=$d and $h>=$v){
			
			$matrixValues [$i][$j][0] = $i;
			$matrixValues [$i][$j][1] = $j-1;
			$matrixValues [$i][$j][2] = $h;
			
			}
			
		elsif($v>=$d and $v>=$h){
			
			$matrixValues [$i][$j][0] = $i-1;
			$matrixValues [$i][$j][1] = $j;
			$matrixValues [$i][$j][2] = $v;
			
			}	
		
		elsif($d>=$h and $d>=$v){
			
			$matrixValues [$i][$j][0] = $i-1;
			$matrixValues [$i][$j][1] = $j-1;
			$matrixValues [$i][$j][2] = $d;
			
			}
			 # print $i . "\t". $j . "\n";
			 # print $matrixValues [$i][$j][0]."\t";
			 # print $matrixValues [$i][$j][1]."\t";
			 # print $matrixValues [$i][$j][2]."\n";
			 # print $d."\n".$v."\n".$h."\n";
			
		
		
		} #else
		
		
		} #loop
	
	
	} #loop
	
	# print $matrixValues [@sequence1-1][@sequence2-1][0]."\n";
	# print $matrixValues [@sequence1-1][@sequence2-1][1]."\n"; #53
	# print $matrixValues [@sequence1-1][@sequence1-1][2]."\n"; #55
	# print @sequence1."\t".@sequence2."\n";
	# # print $sequence1[45]."\n";
	
my $i=@sequence1-1;
my $j=@sequence2-1;

my @newSeq1;
my @newSeq2;
my $x;
my $y;
	
	while($i != 0 or $j != 0){
		
$x=$matrixValues[$i][$j][0];
$y=$matrixValues[$i][$j][1];
		
		
		
		if($i-$x==1 and $j-$y==1){
			
			unshift @newSeq1,$sequence1[$i];
			unshift @newSeq2,$sequence2[$j];
			# print $newSeq1[$i]."\t".$newSeq2[$j]."\n";
			}
		elsif($i-$x==0){
			
			unshift @newSeq1,"-";
			unshift @newSeq2,$sequence2[$j];
			# print $newSeq1[$i]."\t".$newSeq2[$j]."\n";
			
			}	
			
		elsif($j-$y==0){
			
			unshift @newSeq1,$sequence1[$i];
			unshift @newSeq2,"-";
			# print $newSeq1[$i]."\t".$newSeq2[$j]."\n";
			}
		#print $newSeq1[$i]."\t".$newSeq2[$j]."\n";
		
		$i=$x;
		$j=$y;
		
	}
		
	# print @newSeq1-1 ."\n".@newSeq2-1 ."\n";
		
foreach my $seq1 (@newSeq1){
	
	print $seq1;
	
	}
	
print "\n";
	
foreach my $seq (@newSeq2){
	
	print $seq;
	
	}
print "\n"."Score: $matrixValues[@sequence1-1][@sequence2-1][2]". "\n";
