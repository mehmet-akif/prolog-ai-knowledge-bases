
% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Enes Polat
%%%%% NAME: Akif Sipahi
%%%%% NAME: Ekrem Yilmaz
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: q2_kb
%%%%% You should put the atomic statements in your KB below in this section

hasAccount(john, cibc, 1000).
hasAccount(john, bmo, 500).
hasAccount(alice, cibc, 1200).
hasAccount(alice, bmo, 1600).

totalDeposits(john, cibc, 500).
totalDeposits(john, bmo, 200).
totalDeposits(alice, cibc, 300).
totalDeposits(alice, bmo, 400).

totalWithdrawals(john, cibc, 100).
totalWithdrawals(john, bmo, 50).
totalWithdrawals(alice, cibc, 150).
totalWithdrawals(alice, bmo, 75).

monthlyRate(cibc, 0.005). % 0.5%
monthlyRate(bmo, 0.003).  % 0.3%

interestLevel(cibc, 1000).
interestLevel(bmo, 1500).

penalty(cibc, 50).
penalty(bmo, 75).


%%%%% SECTION: q2_rules
%%%%% Put statements for subtotal, accruedInterest, accruedPenalty, and endOfMonthBalance below.
%%%%% You may also put helper predicates here
%%%%% DO NOT PUT ATOMIC FACTS FOR hasAccount, totalDeposits, totalWithdrawals, monthlyRate, interestRate, or penalty below.

subtotal(Name, Bank, Subtotal) :-
    hasAccount(Name, Bank, Balance),
    totalDeposits(Name, Bank, Deposits),
    totalWithdrawals(Name, Bank, Withdrawals),
    Subtotal is Balance + Deposits - Withdrawals.

accruedInterest(Name, Bank, Interest) :-
    subtotal(Name, Bank, Subtotal),
    interestLevel(Bank, MinLevel),
    monthlyRate(Bank, Rate),
    (Subtotal >= MinLevel ->
        Interest is Subtotal * Rate
    ; 
        Interest is 0).

accruedPenalty(Name, Bank, Penalty) :-
    subtotal(Name, Bank, Subtotal),
    penalty(Bank, PenaltyAmount),
    (Subtotal < 0 ->
        Penalty is PenaltyAmount
    ;
        Penalty is 0).

endOfMonthBalance(Name, Bank, Balance) :-
    subtotal(Name, Bank, Subtotal),
    accruedInterest(Name, Bank, Interest),
    accruedPenalty(Name, Bank, Penalty),
    Balance is Subtotal + Interest - Penalty.

endOfMonthBalance(Name, TotalBalance) :-
    endOfMonthBalance(Name, cibc, BalanceCIBC),
    endOfMonthBalance(Name, bmo, BalanceBMO),
    TotalBalance is BalanceCIBC + BalanceBMO.



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
