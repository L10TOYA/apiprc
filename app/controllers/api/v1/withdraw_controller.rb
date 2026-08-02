module Api
    module V1
        class WithdrawController < BaseController
            before_action :set_transaction_amount, :balance_is_enough?
            def create
                @bank_account.balance -= transaction_amount
                @bank_account.save
                render json:{
                    message: "Your withdraw was successful"
                }
            end

            private
            def balance_is_enough?
                if (@bank_account.balance - transaction_amount) < 0
                    render json:{
                        error: "Your balance is not enough for this transaction amount"
                    }
                end
            end
        end
    end
end
