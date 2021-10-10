class BooksController < ApplicationController
  def list
    # tells Rails to search the books table and store each row it finds in the @books object
    @books = Book.all
  end

  def show
    # tells Rails to find only the book that has the id defined in params[:id]
    # the params object/hash is a container that enables you to pass values between method calls
    @book = Book.find(params[:id])
  end

  def new
    # This method will be called when you will display a page to the user to take user input
    # The second line grabs all subjects from the subjects from the database and puts them in
    # an array called @subjects
    @book = Book.new
    @subjects = Subject.all
  end

  def create
    # creates a new instance variable called @book that holds a Book objuect built from the datathe user submitted.
    # The data was passed from the new method to create using the params object.
    @book = Book.new(book_params)

    if @book.save
      # The redirect_to method is similar to performing a meta refresh on a web page:
      # it automatically forwards you to your destination without any user interaction.
      redirect_to :action => 'list'
    else
      @subjects = Subject.all
      render :action => 'new'
    end
  end

  def book_params
    params.require(:books).permit(:title, :price, :subject_id, :description)
  end

  def edit
    # This method will be called to display dta on the screen to be modified by the user
    @book = Book.find(params[:id])

    # grabs all the subjects from the database and puts them in an array subjects.
    @subjects = Subject.all
  end

  def update
    @book = Book.find(params[:id])

    # The update_attributes method is similar to the save method used by create but instead of
    # creating a new row in the database, it overwrites the attributes of the existing row.
    if @book.update_attributes(book_param)
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      render :action => 'edit'
    end
  end

  def book_param
    params.require(:book).permit(:title, :price, :subject_id, :description)
  end

  def delete
    # finds the book based on the parameter passed via the params object and then deletes it using the destroy method.
    Book.find(params[:id]).destroy

    # redirects the user to the list method using a redirect_to call.
    redirect_to :action => 'list'
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end

end
