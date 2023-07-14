require 'rails_helper'

describe User, type: :model do
    subject {User.new(name: 'Tim', photo:'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from London')}

    before {subject.save}

    it 'name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

     it 'posts_counter should be greater than or equal to 1' do
        subject.posts_counter = 1
        expect(subject).to be_valid
    end

     it 'posts_counter should be an integer' do
        subject.posts_counter = 0.002
        expect(subject).to_not be_valid
    end
end

