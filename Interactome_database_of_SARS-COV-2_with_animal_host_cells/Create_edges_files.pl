#!/usr/bin/perl

use warnings;
use strict;

my ($file1, $file2, $outputfile);
$file1 = "nodes.csv";                       # File containing the viral and host proteins and their labels  #
$file2 = "SARS-CoV-2_HPI.csv";                                   # File containing the protein interactions #
$outputfile = "edges.csv";

sub Create_edges_csv_file {
  my ($file1, $file2, $outputfile) = @_;
  my (@array, @record);
  my (%id);
  if (!open(OUTFILE,">$outputfile")) {                 # If "$outputfile File" could NOT be opened make a.. #
    print "   !!! Could NOT open \"Output File\" $outputfile - program stopped !!!\n\n";    # ...message... #
    exit(); }                                                                            # Exit the program #
  print OUTFILE "to,from\n";
  print OUTFILE "1,2\n1,3\n1,4\n1,5\n1,6\n1,7\n1,8\n1,9\n1,10\n1,11\n1,12\n1,13\n1,14\n1,15\n1,16\n1,17\n"; #
  print OUTFILE "1,18\n1,19\n1,20\n1,21\n1,22\n1,23\n1,24\n1,25\n1,26\n1,27\n1,28\n1,29\n1,30\n1,31\n";     #
  print OUTFILE "1,33\n1,34\n1,35\n1,36\n1,37\n";                                                           #
  if (!open(INFILE1,"<$file1")) {                           # If "$file1 File" could NOT be opened make a.. #
    print "   !!! Could NOT open \"Input File\" $file1 - program stopped !!!\n\n";          # ...message... #
    exit(); }                                                                            # Exit the program #
  while (<INFILE1>) {                                                               # While not End of File #
    chomp;
    if (!($_ =~ /label|SARS-Cov-2/)) {
      @array = split(/\,/, $_);
      $id{$array[1]} = $array[0];
    }
  } close INFILE1;
  if (!open(INFILE2,"<$file2")) {                           # If "$file2 File" could NOT be opened make a.. #
    print "   !!! Could NOT open \"Input File\" $file2 - program stopped !!!\n\n";          # ...message... #
    exit(); }                                                                            # Exit the program #
  while (<INFILE2>) {                                                               # While not End of File #
    chomp;
    if (!($_ =~ /Viral protein/)) {
      @record = split(/\,/, $_);
      print OUTFILE "$id{$record[0]},$id{$record[1]}\n";
    }
  }
  close INFILE2;
  close OUTFILE;
}

Create_edges_csv_file ($file1, $file2, $outputfile);

