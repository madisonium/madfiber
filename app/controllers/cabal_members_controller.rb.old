class CabalMembersController < ApplicationController
  def index
    @cabal_members = [
      {
        :name => 'Preston Austin',
        :url => 'http://madison.imby.info/p/prestonaustin',
        :business => 'in my back yard - Madison',
        :business_url => 'http://madison.imby.info'
      },
      {
        :name => 'Matt Younkle',
        :url => 'http://madison.imby.info/users/157',
        :business => 'Y Innovation, LLC',
        :business_url => 'http://www.y-innovation.com'
      },
      {
        :name => 'Bradley Grzesiak',
        :url => 'http://twitter.com/listrophy',
        :business => 'Bendyworks, LLC',
        :business_url => 'http://bendyworks.com'
      },
      {
        :name => 'Forrest Woolworth',
        :url => 'http://madison.imby.info/users/187',
        :business => 'PerBlue, Inc',
        :business_url => 'http://www.perblue.com'
      },
      {
        :name => 'Scott Resnick',
        :url => 'http://www.linkedin.com/pub/scott-resnick/9/29/471',
        :business => 'Hardin Design & Development',
        :business_url => 'http://www.hardindd.com/'
      },
      {
        :name => 'Greg Tracy',
        :url => 'http://www.gregtracy.com',
        :business => 'Sharendipity',
        :business_url => 'http://www.sharendipity.com'
      },
      {
        :name => 'Nathan Lustig',
        :url => 'http://www.nathanlustig.com',
        :business => 'Entrustet, Capital Entrepreneurs',
        :business_url => 'http://www.entrustet.com'
      },
    ].sort {|a,b| a[:name].split(' ').last <=> b[:name].split(' ').last}
  end
end
