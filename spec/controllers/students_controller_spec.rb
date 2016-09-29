require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let!(:student) { create(:student) }

  describe '#index' do
    before { get :index }

    it 'assigns students' do
      expect(assigns(:students)).to match_array [student]
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

    it 'assigns student' do
      expect(assigns(:student)).to be_a_new Student
    end

    context 'with view' do
      render_views

      it 'renders new' do
        expect(response).to render_template(:new)
      end
    end    
  end

  describe '#create' do
    context 'with valida attributes' do
      subject { post :create, student: attributes_for(:student) }

      it 'creates a new student' do
        expect { subject }.to change(Student, :count).by(1)
      end

      it 'redirects to student_path' do
        subject

        expect(response).to redirect_to student_path(Student.last)
      end
    end

    context 'with valida attributes' do
      subject { post :create, student: { name: '', register_number: 'AB123' } }

      it 'does not create a new student' do
        expect { subject }.to change(Student, :count).by(0)
      end

      it 'renders new' do
        subject

        expect(response).to render_template(:new)
      end
    end    
  end

  describe '#edit' do
    before { get :edit, id: student.id }

    it 'assigns student' do
      expect(assigns(:student)).to eq student
    end

    context 'with view' do
      render_views

      it 'renders edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#show' do
    before { get :show, id: student.id }

    it 'assigns student' do
      expect(assigns(:student)).to eq student
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
      subject { patch :update, id: student, student: { name: 'Chico' } }

      it 'updates student' do
        subject
        student.reload
        expect(student.name).to eq 'Chico'
      end

      it 'redirects to student_path' do
        subject
        expect(response).to redirect_to student_path(student)
      end
    end

    context 'with invalid attributes' do
      subject { patch :update, id: student, student: { name: '' } }

      it 'updates student' do
        subject
        student.reload
        expect(student.name).to eq 'Marco'
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
    subject { delete :destroy, id: student.id }

    it 'deletes student' do
      expect { subject }.to change(Student, :count).by(-1)
    end

    it 'redirects to students_path' do
      subject
      expect(response).to redirect_to students_path
    end
  end
end
