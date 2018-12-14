class PostsController < ApplicationController
  include ShopifyApp::AppProxyVerification
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @shop = Shop.find_by(shopify_domain: params[:shop])
    if @shop
      @shop.with_shopify_session do
      @products = ShopifyAPI::Product.find(:all)
      end
    end
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def tag_product
    puts params
 
    puts @post = Post.find(params[:post_id])
    puts @image = params[:image]
    @post.attributes.keys.each do |key|
      unless @post.attribute[key].present? do 
      @post.update(':product'+key+'_url' => @image ) 
      do_break = true
      end
      break if do_break
    end
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def post_params
    #   params.require(:post).permit(:image_url, :image, :product1_url)
    # end
end
