require 'net/http'
require 'uri'
require 'json'

class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy]

  # GET /charities
  # GET /charities.json
  def index
    @charities = Charity.all
  end

  # GET /charities/1
  # GET /charities/1.json
  def show
  end

  # GET /charities/new
  def new
    @charity = Charity.new
  end

  # GET /charities/1/edit
  def edit
  end

  # POST /charities
  # POST /charities.json
  def create
    @charity = Charity.new(charity_params)
    uri = URI.parse("http://api.reimaginebanking.com/customers?key=ec40a3477234fc9418ca405ec3daa910")

    header = {"Content-Type"=> "application/json;charset=UTF-8"}
    customer = {
        "first_name": @charity.name,
        "last_name": "Trust",
        "address": {
            "street_number": "2820",
            "street_name": "Avent ferry Road",
            "city": "Raleigh",
            "state": "NC",
            "zip": "27606"
        }
    }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = customer.to_json

    # Send the request
    response = http.request(request)
    parsed_resp = JSON.parse(response.body)
    @charity.cust_id = parsed_resp["objectCreated"]["_id"]
    uri = URI.parse("http://api.reimaginebanking.com/customers/#{@charity.cust_id}/accounts?key=ec40a3477234fc9418ca405ec3daa910")

    header = {"Content-Type"=> "application/json;charset=UTF-8"}
    account = {
        "type": "Credit Card",
        "nickname": "CharityAccount",
        "rewards": 0,
        "balance": 0
    }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = account.to_json

    # Send the request
    response = http.request(request)
    parsed_resp = JSON.parse(response.body)
    @charity.acc_id = parsed_resp["objectCreated"]["_id"]
    @charity.balance = parsed_resp["objectCreated"]["balance"]
    respond_to do |format|
      if @charity.save
        format.html { redirect_to @charity, notice: 'Charity was successfully created.' }
        format.json { render :show, status: :created, location: @charity }
      else
        format.html { render :new }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charities/1
  # PATCH/PUT /charities/1.json
  def update
    respond_to do |format|
      if @charity.update(charity_params)
        format.html { redirect_to @charity, notice: 'Charity was successfully updated.' }
        format.json { render :show, status: :ok, location: @charity }
      else
        format.html { render :edit }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charities/1
  # DELETE /charities/1.json
  def destroy
    @charity.destroy
    respond_to do |format|
      format.html { redirect_to charities_url, notice: 'Charity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charity
      @charity = Charity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charity_params
      params.require(:charity).permit(:name, :cust_id, :acc_id, :balance)
    end
end
