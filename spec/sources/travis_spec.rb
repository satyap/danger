require 'spec_helper'
require 'danger/ci_source/travis'

describe Danger::Travis do
  it 'validates when Josh K says so' do
    env = { "HAS_JOSH_K_SEAL_OF_APPROVAL" => "true" }
    expect(Danger::Travis.validates?(env)).to be true
  end

  it 'doesnt validate when Josh K aint around' do
    env = { "CIRCLE" => "true" }
    expect(Danger::Travis.validates?(env)).to be false
  end

  it 'gets the pull request ID' do
    env = { "TRAVIS_PULL_REQUEST" => "2" }
    t = Danger::Travis.new(env)
    expect(t.pull_request_id).to eql("2")
  end

  it 'gets the repo address' do
    env = { "TRAVIS_REPO_SLUG" => "orta/danger" }
    t = Danger::Travis.new(env)
    expect(t.repo_slug).to eql("orta/danger")
  end

end
