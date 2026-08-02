module Api
    module V1
        class DepositController < BaseController
            before_action :set_transaction_amount
            def create

                    @bank_account.balance += transaction_amount
                    @bank_account.save
                    render json:{
                        message: "Your money was deposited!"
                    }

                
            end

        end
    end
end
