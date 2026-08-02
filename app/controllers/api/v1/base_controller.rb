module Api
    module V1
        class BaseController < ApplicationController
            attr_reader :transaction_amount
            before_action :find_bank_account

        private
            def find_bank_account
                @bank_account = BankAccount.find_by(account_number: params[:account_number])

                if !@bank_account
                    render json:{
                        error: "Failed to find a bank account for this number"
                    }
                end
            end

            def set_transaction_amount
                _transaction_amount = params[:amount].to_f

                if _transaction_amount <= 0
                    return render json:{
                        error: "Your deposit amount must be greater than 0"
                    }
                end

                @transaction_amount = _transaction_amount
            end
        end
    end
end
