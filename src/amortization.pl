#!/usr/bin/perl

# file: amoratization.pl
# author: Zeb DeOs (zebdeos@bayprogrammer.com)
# rev. 12/9/2010 zmd
# reference: http://money.howstuffworks.com/personal-finance/debt-management/credit-card8.htm
# main function convention adopted per Bill Weinman's Lynda.com video tutorial

use strict;
use warnings;
use Data::Dumper;  # TODO: only for testing

main(@ARGV);

sub main
{
    # Configuration
    # TODO: Read in configuration from command-line flags to set config
    
    my ($apr, $bal, $pay) = @_;
    unless ($apr && $bal && $pay)
    {
        print "usage: amoratization.pl apr balance monthly_payment\n";
        return;
    }

    # Compute the monthly interest rate
    my $monthly_interest_rate = ($apr / 12) / 100;
    
    my @amoratization_table = calc_all($monthly_interest_rate, $bal, $pay);
    
    out_table(@amoratization_table);
}

# calc(apr, bal, pay) computes the finance charge and resulting principle
# for a given balance, apr, and payment
sub calc
{
    my ($monthly_interest_rate, $bal, $pay) = @_;

    my $finance_charge = a_round($bal * $monthly_interest_rate);
    my $principle_paid = $pay - $finance_charge;
    $bal = $bal + $finance_charge;
    $bal = $bal - $pay;
    
    return ($bal, $finance_charge, $principle_paid);
}

# calc_all(apr, bal, pay) computes an amoratization table and returns an array
sub calc_all
{
    my ($monthly_interest_rate, $bal, $pay) = @_;

    my @amoratization_table;
    my $payment_number = 0;

    # TODO: Make sure payment is sufficient to reduce principle!!!
    while ($bal > $pay)
    {
        my $finance_charge = 0;
        my $principle_paid = 0;
        $payment_number++;
        ($bal, $finance_charge, $principle_paid) =
            calc($monthly_interest_rate, $bal, $pay);
        push @amoratization_table,
            [
                $payment_number, 
                a_round($principle_paid),
                a_round($finance_charge),
                a_round($bal)
            ];
    }
    
    unless ($bal == 0)
    {
        # Pay whatever's left; no finance charge or remaining balance
        $payment_number++;
        push @amoratization_table, [$payment_number, a_round($bal), 0, 0];
    }
    
    return @amoratization_table;
}

sub out_table
{
    my @table = @_;
    print "pay #\tamount paid\tfinance\tprinciple\tbalance\n";
    print "=====\t===========\t=======\t=========\t=======\n";
    
    # Variables to hold totals:
    my $total_amount_paid = 0;
    my $total_finance_charges = 0;
    my $total_principle = 0;

    foreach my $record (@table)
    {
        # Get or calculate the fields for current record
        my ($payment_number, $principle_paid, $finance_charge, $bal) =
            @$record;
        my $amount_paid = a_round($principle_paid + $finance_charge);
        
        # Compute running totals:
        $total_amount_paid += $amount_paid;
        $total_finance_charges += $finance_charge;
        $total_principle += $principle_paid;
        
        # Left-justify (left-pad) the fields to column head widths
        $payment_number = l_pad(5 ,$payment_number);
        $principle_paid = l_pad(9, $principle_paid);
        $finance_charge = l_pad(7, $finance_charge);
        $bal = l_pad(7, $bal);
        $amount_paid = l_pad(11, $amount_paid);
        
        # Print out the current record
        print "$payment_number\t$amount_paid\t$finance_charge\t$principle_paid\t$bal\n";
    }
    
    # Format and print out totals
    $total_amount_paid = l_pad(11, a_round($total_amount_paid));
    $total_finance_charges = l_pad(7, a_round($total_finance_charges));
    $total_principle = l_pad(9, a_round($total_principle));
    
    print "\nTOTALS:\n\n";
    print "     \t$total_amount_paid\t$total_finance_charges\t$total_principle\n";
}

sub a_round
{
    my $value = shift;
    return sprintf("%.2f", $value);
}

sub l_pad
{
    my ($total, $val) = @_;
    my $amt = $total - length($val);
    my $str = " " x $amt;
    return $str . $val;
}






