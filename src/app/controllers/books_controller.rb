class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new
    #@book = Book.new(:user_id => current_user.id)
    #@book.save
    #@user = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, :notice => 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  # GET /books/search
  def search
  end

  # POST /books/search
  def result
    @books = Book.where 'title=? OR author=? OR category=?', params[:title], params[:author], params[:category]
    @users = User.all
    @friends = Friend.all
    render :result
  end

  def picture
    @book = Book.find(params[:id])
    send_data(@book.picture_data, :type => @book.content_type, :disposition => 'inline')
  end
end
