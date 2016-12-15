class ProductsController < ApplicationController
  def index
	@user = User.find(session[:user_id])
	@products = Product.where("user_id = ? AND sold = ?", @user.id, 'false')
	@products_sold = Product.where("user_id = ? AND sold = ?", @user.id, 'true')
	@purchases = Product.where("user_id = ? AND buyer_id = ?", @user.id, @user.id)
  end

  def create
	product = Product.new(name: post_product[:name], user: User.find(session[:user_id]), sold: false, date_posted: DateTime.now.to_date, amount: post_product[:amount])
	if product.valid?
		product.save
		redirect_to "/dashboard/#{session[:user_id]}"
	else
		flash[:message] = 'Please enter valid information!'
		redirect_to "/dashboard/#{session[:user_id]}"
	end
  end

  def destroy
    @user = User.find(session[:user_id])
	Product.find(params[:id]).destroy
	redirect_to "/dashboard/#{@user.id}"
  end

  def show
	@user = User.find(session[:user_id])
	@products = Product.all.where("sold = ?", false).where.not("user_id = ?", @user.id)
  end

  def buy
	@user = User.find(session[:user_id])
	product = Product.update(params[:id], sold: true, buyer: User.find(@user.id))
	Product.create(name: product.name, user: User.find(@user.id), date_posted: DateTime.now.to_date, amount: product.amount, buyer: User.find(@user.id), seller: User.find(product.user.id))
	redirect_to "/dashboard/#{@user.id}"
  end

  private
  def post_product
	params.require(:product).permit(:name, :amount)
  end
end
