(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

accessing each account to find the balance needs to be locked until after the exchange.
Louis is wrong - as we know the amount to transfer in advance, the balances will be correct when run in any sequence once all the processes have finished running

difference - an internal variable introduced - gives rise to problem of inconsistency if 2 exchange operations interleaved  