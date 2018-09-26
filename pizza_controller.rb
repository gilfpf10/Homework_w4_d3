require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza_order")
also_reload("./models/*")

#index root all pizzas
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#create a pizza
get "/pizza-orders/new" do
erb(:new)
end

#show 1 pizza
get "/pizza-orders/:id" do
@order = PizzaOrder.find(params[:id])
erb(:show)
end

get "pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])
  @order.update
  @order.save
  erb(:edit)
end

#create - make a pizza_order
post "/pizza-orders" do
@order = PizzaOrder.new(params)
@order.save()
erb(:show)
end

post "/pizza-orders/:id/delete" do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  erb(:delete)
end

post "/pizza-orders/:id/update" do
  @order = PizzaOrder.find(params[:id])
  @order.update
  erb(:update)
end
