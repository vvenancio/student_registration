require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:course) { create(:course) }

  describe '#index' do
    before { get :index }

    it 'assigns courses' do
      expect(assigns(:courses)).to match_array [course]
    end

    context 'with view' do
      render_views

      it 'renders index' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#new' do
    before { get :new }

    it 'assigns course' do
      expect(assigns(:course)).to be_a_new Course
    end

    context 'with view' do
      render_views

      it 'renders new' do
        expect(response).to render_template(:new)
      end
    end    
  end

  describe '#create' do
    context 'with valid attributes' do
      subject { post :create, course: attributes_for(:course) }

      it 'creates a new course' do
        expect { subject }.to change(Course, :count).by(1)
      end

      it 'redirects to course_path' do
        subject

        expect(response).to redirect_to course_path(Course.last)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, course: { description: '' } }

      it 'does not create a new course' do
        expect { subject }.to change(Course, :count).by(0)
      end

      it 'renders new' do
        subject

        expect(response).to render_template(:new)
      end
    end    
  end

  describe '#edit' do
    before { get :edit, id: course.id }

    it 'assigns course' do
      expect(assigns(:course)).to eq course
    end

    context 'with view' do
      render_views

      it 'renders edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#show' do
    before { get :show, id: course.id }

    it 'assigns course' do
      expect(assigns(:course)).to eq course
    end

    context 'with view' do
      render_views

      it 'renders show' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#update' do
    context 'with valid attributes' do
      subject { patch :update, id: course, course: { name: 'Matemática' } }

      it 'updates course' do
        subject
        course.reload
        expect(course.name).to eq 'Matemática'
      end

      it 'redirects to course_path' do
        subject
        expect(response).to redirect_to course_path(course)
      end
    end

    context 'with invalid attributes' do
      subject { patch :update, id: course, course: { name: '' } }

      it 'updates course' do
        subject
        course.reload
        expect(course.name).to eq 'Biologia'
      end

      context 'with view' do
        render_views

        it 'renders edit' do
          subject
          expect(response).to render_template(:edit)
        end
      end
    end    
  end

  describe '#destroy' do
    subject { delete :destroy, id: course.id }

    it 'deletes course' do
      expect { subject }.to change(Course, :count).by(-1)
    end

    it 'redirects to courses_path' do
      subject
      expect(response).to redirect_to courses_path
    end
  end
end
