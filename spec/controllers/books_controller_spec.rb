require "rails_helper"

RSpec.describe BooksController do
  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe 'GET #index' do
    let(:books) {[
      instance_double(Book),
      instance_double(Book)
      ]}

    before do
      allow(user).to receive(:books).and_return(books)

      get :index
    end

    it 'looks up all books that belong to the current user' do
      expect(assigns(:books)).to eq(books)
    end
  end

  describe 'PATCH #update' do
    let(:book) { FactoryBot.build_stubbed(:book) }

    before do
      allow(Book).to receive(:find).and_return(book)
      allow(book).to receive(:update).and_return(true)
    end

    it 'updates the book' do
      patch :update, :params => {
        :id => book.id,
        :book => { :name => 'New name' }
      }
      expect(book).to have_received(:update)
    end

    context 'when the update succeds' do
      it 'redirects to the book page' do
        patch :update, :params => {
          :id => book.id,
          :book => { :name => 'New Name' }
        }
        expect(response).to redirect_to(book_path(book))
      end
    end

    context 'when the update fails' do
      before do
        allow(book).to receive(:update).and_return(false)
      end

      it 'renders the edit page again' do
        patch :update, :params => {
          :id => book.id,
          :book => { :name => 'New Name' }
        }
        expect(response).to render_template(:edit)
      end
    end

  end

  describe 'DELETE #destroy' do
    let(:book) { FactoryBot.build_stubbed(:book) }

    before do
      allow(Book).to receive(:find).and_return(book)
      allow(book).to receive(:destroy)

      delete :destroy, :params => { :id => book.id }
    end

    it 'deletes the book' do
      expect(book).to have_received(:destroy)
    end

    it 'redirects to the index page' do
      expect(response).to redirect_to(books_path)
    end
  end
end
