#!/usr/bin/perl -w
 
###########################
#### The Central Dogma ####
###########################
 

### Genome
$DNA_seq = "#######"; #enter your DNA sequence, single strain
 
### Transcription

## Here you want to convert the DNA sequence to the equivalent RNA sequence,
## in a variable called '$RNA_seq'.  Do this by first copying the value of one
## into the other, then using perl's regular expression for substitution.
## For example, if you wanted to copy the value of $DNA_seq into a variable
## named '$a', you'd write the following:

$a = $DNA_seq;
$a =~ s/T/U/g;

## Change all occurences of 'T' to 'U' in $a.

$RNA_seq = $a;

## Print RNA:

print "The RNA sequence is:\n";
print "$RNA_seq\n";

### 3 Frames:

$RNA_seq1 = substr($RNA_seq,0,length.$RNA_seq-2);  
$RNA_seq2 = substr($RNA_seq,1,length.$RNA_seq-1);
$RNA_seq3 = substr($RNA_seq,2);

### Translation 1

## Here you need to translate your RNA sequence into a protein sequence
## in three different reading frames.  Use the subroutine provided at the
## bottom ('translate_codon') as follows:

print "The first 3 proteins are:\n";
$protein1 = dna2peptide($RNA_seq1);    
print "$protein1\n"; 
$protein2 = dna2peptide($RNA_seq2);    
print "$protein2\n"; 
$protein3 = dna2peptide($RNA_seq3);    
print "$protein3\n"; 


### Now take the reverse-complement of the sequence

## First you want to change your sequence to the opposite order (hint: check
## out perl's 'reverse' function).  Save your results into a variable called
## '$reversed'.

$reversed_RNA_seq = reverse $RNA_seq;
$reversed_RNA_seq  =~ s/A/U/g;
$reversed_RNA_seq  =~ s/U/A/g;
$reversed_RNA_seq  =~ s/C/G/g;
$reversed_RNA_seq  =~ s/G/C/g;


## Print your results:
    
print "The reverse RNA sequence is:\n";
print "$reversed_RNA_seq\n";

## Next change each nucleotide to its complement.  A good way to
## do this uses perl's 'tr' function.
    
$RNA_seq4 = substr($reversed_RNA_seq,0,186);  
$RNA_seq5 = substr($reversed_RNA_seq,1,186);
$RNA_seq6 = substr($reversed_RNA_seq,2);
    

### Translation 2

print "The last 3 proteins are:\n";
$protein4 = dna2peptide($RNA_seq4);    
print "$protein4\n"; 
$protein5 = dna2peptide($RNA_seq5);    
print "$protein5\n"; 
$protein6 = dna2peptide($RNA_seq6);    
print "$protein6\n";

## Once again, translate your RNA sequence into a protein sequence
## in three different reading frames, and print the results to output.  The
## code for this can be an exact copy of your code from earlier.


############################### Subroutines ##############################

sub dna2peptide    
{    
    my ($dna)=@_;    
    my $protein ='';    
    for (my $i=0; $i<(length($dna)-2);$i+=3)    
    {    
        $protein .=translate_codon(substr($dna,$i,3));    
    }    
    return $protein;
}    

sub translate_codon {
      if ($_[0] =~ /GC./i) {return Ala;} 
      if ($_[0] =~ /UGC|UGU/i) {return Cys;} 
      if ($_[0] =~ /GAC|GAU/i) {return Asp;}
      if ($_[0] =~ /GAA|GAG/i) {return Glu;}
      if ($_[0] =~ /UUC|UUU/i) {return Phe;}
      if ($_[0] =~ /GG./i) {return Gly;}
      if ($_[0] =~ /CAC|CAU/i) {return His;}
      if ($_[0] =~ /AUA|AUC|AUU/i) {return Ile;}
      if ($_[0] =~ /AAA|AAG/i) {return Lys;}
      if ($_[0] =~ /UUA|UUG|CU./i) {return Leu;}
      if ($_[0] =~ /AUG/i) {return Met;}
      if ($_[0] =~ /AAC|AAU/i) {return Asn;}
      if ($_[0] =~ /CC./i) {return Pro;}
      if ($_[0] =~ /CAA|CAG/i) {return Gln;}
      if ($_[0] =~ /AGA|AGG|CG./i) {return Arg;}
      if ($_[0] =~ /AGC|AGU|UC./i) {return Ser;}
      if ($_[0] =~ /AC./i) {return Thr;}
      if ($_[0] =~ /GU./i) {return Val;}
      if ($_[0] =~ /UGG/i) {return Trp;}
      if ($_[0] =~ /UAC|UAU/i) {return Tyr;}
      if ($_[0] =~ /UAA|UGA|UAG/i) {return "***";}
}
