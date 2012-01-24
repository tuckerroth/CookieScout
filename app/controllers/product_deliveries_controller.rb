class ProductDeliveriesController < ApplicationController
  # GET /product_deliveries
  # GET /product_deliveries.json
  def index
    @product_deliveries = ProductDelivery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_deliveries }
    end
  end

  # GET /product_deliveries/1
  # GET /product_deliveries/1.json
  def show
    @product_delivery = ProductDelivery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_delivery }
    end
  end

  # GET /product_deliveries/new
  # GET /product_deliveries/new.json
  def new
    @product_delivery = ProductDelivery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_delivery }
    end
  end

  # GET /product_deliveries/1/edit
  def edit
    @product_delivery = ProductDelivery.find(params[:id])
  end

  # POST /product_deliveries
  # POST /product_deliveries.json
  def create
    @product_delivery = ProductDelivery.new(params[:product_delivery])

    respond_to do |format|
      if @product_delivery.save
        format.html { redirect_to @product_delivery, notice: 'Product delivery was successfully created.' }
        format.json { render json: @product_delivery, status: :created, location: @product_delivery }
      else
        format.html { render action: "new" }
        format.json { render json: @product_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_deliveries/1
  # PUT /product_deliveries/1.json
  def update
    @product_delivery = ProductDelivery.find(params[:id])

    respond_to do |format|
      if @product_delivery.update_attributes(params[:product_delivery])
        format.html { redirect_to @product_delivery, notice: 'Product delivery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_deliveries/1
  # DELETE /product_deliveries/1.json
  def destroy
    @product_delivery = ProductDelivery.find(params[:id])
    @product_delivery.destroy

    respond_to do |format|
      format.html { redirect_to product_deliveries_url }
      format.json { head :no_content }
    end
  end
end
