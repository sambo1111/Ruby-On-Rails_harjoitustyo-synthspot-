FactoryGirl.define do
  factory :instrument do
    name "TR-909"
    year 1995
    info "yoda yoda"
    manufacturer
    type
  end

  factory :user do
    username "admin"
    password "salainen"
    password_confirmation "salainen"
    admin true
  end

  factory :type do
    name "Drum Machines"
    info "joda joda"
  end

  factory :manufacturer do
    name "Roland"
    year 1990
    info "yadda yadda"
  end

  factory :suggestion do
    topic "newstuff"
    info "jee"
    user
  end
end
