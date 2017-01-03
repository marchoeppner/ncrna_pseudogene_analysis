#!/usr/bin/perl

use Bio::EnsEMBL::Registry;
use Bio::DB::Taxonomy;
use Bio::TreeIO;
use Bio::Tree::Tree;
use Bio::Tree::TreeFunctionsI;

my $usage = qq{
perl DumpMultiAlign.pl
  Getting help:
    [--help]

  Input:
    [--infile filename]
	The name of the file to use as input

  Ouput:
    [--outfile filename]
        The name of the output file. By default the output is the
        standard output
};

my $outfile = undef;
my $infile = undef;
my $help;

GetOptions(
    "help" => \$help,
    "output_file=s" => \$output_file);

# Print Help and exit
if ($help) {
    print $usage;
    exit(0);
}

if ($outfile) {
    open(STDOUT, ">$output_file") or die("Cannot open $outfile");
}

my $registry = Bio::EnsEMBL::Registry; 
$registry->load_registry_from_db(
    -host => 'ensembldb.ensembl.org',
    -user => 'anonymous'
);

