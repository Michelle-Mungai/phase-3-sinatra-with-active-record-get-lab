class ApplicationController < Sinatra::Base
  # add routes
  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  set :default_content_type, 'application/json'
  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked = BakedGood.order(price: :desc)
    baked.to_json
  end

  get '/baked_goods/most_expensive' do
    baked = BakedGood.order(price: :desc).limit(1)[0]
    baked.to_json
  end
end
