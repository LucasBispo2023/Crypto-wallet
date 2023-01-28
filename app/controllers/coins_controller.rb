class CoinsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_coin, only: [:show, :edit, :update, :destroy]
    before_action :set_coins, only: [:index, :refresh]
    after_action :set_price, only: [:create]

    def index
    end

    def edit
    end

    def new
        @coin = Coin.new()
    end

    def create
        @coin = Coin.new(coin_params)
        if @coin.save
            redirect_to coins_path
        else
            render :new
        end
    end

    def update
        if @coin.update(coin_params)
            set_balance(@coin)
            redirect_to coins_path
        else
            render :edit
        end
    end

    def destroy
        if @coin.destroy
            redirect_to coins_path
        else
            render :index
        end
    end

    def refresh
        @coins.each do |coin|
            @crypto_symbol = coin.acronyn
            @crypto_data = Coin.get_crypto_data(@crypto_symbol)
            coin.price =  @crypto_data["data"][@crypto_symbol.upcase]["quote"]["USD"]["price"]
            set_balance(coin)
        end
        redirect_to coins_path
    end

    private

    def coin_params
        params.require(:coin).permit(:title, :acronyn, :url_image, :quantity, :balance, :id, :user_id, :price)
    end

    def set_coins
        @coins = Coin.where(user_id: current_user)
    end

    def set_coin
        @coin = Coin.find(params[:id])
    end

    def set_price
        @crypto_symbol = @coin.acronyn
        @crypto_data = Coin.get_crypto_data(@crypto_symbol)
        @coin.price =  @crypto_data["data"][@crypto_symbol.upcase]["quote"]["USD"]["price"]
        @coin.balance = @coin.quantity * @coin.price
        @coin.save
    end

    def set_balance(coin)
        coin.balance = coin.quantity * coin.price
        coin.save   
    end
    
end
