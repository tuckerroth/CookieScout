class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    params.permit!
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    params.permit!
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js { render "show.js.erb" }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    params.permit!
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
      format.js { render "new.js.erb" }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.js { render "new.js.erb" }
    end
  end

  # POST /products
  # POST /products.json
  def create
    params.permit!
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        @products = Product.all
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
        format.js { render "create.js.erb" }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    params.permit!
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        @products = Product.all
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
        format.js { render "create.js.erb" }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
