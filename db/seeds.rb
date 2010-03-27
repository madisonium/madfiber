cabal_members = [
  {
    :name => 'Preston Austin',
    :url => 'http://madison.imby.info/p/prestonaustin',
    :business => 'in my back yard - Madison',
    :business_url => 'http://madison.imby.info',
    :image_url => 'https://s3.amazonaws.com/imby_avatars/avatars/10/thumb.jpg'
  },
  {
    :name => 'Matt Younkle',
    :url => 'http://madison.imby.info/users/157',
    :business => 'Y Innovation, LLC',
    :business_url => 'http://www.y-innovation.com',
    :image_url => 'https://s3.amazonaws.com/imby_avatars/avatars/157/thumb.jpg'
  },
  {
    :name => 'Bradley Grzesiak',
    :url => 'http://twitter.com/listrophy',
    :business => 'Bendyworks, LLC',
    :business_url => 'http://bendyworks.com',
    :image_url => 'https://s3.amazonaws.com/imby_avatars/avatars/85/thumb.jpg'
  },
  {
    :name => 'Forrest Woolworth',
    :url => 'http://madison.imby.info/users/187',
    :business => 'PerBlue, Inc',
    :business_url => 'http://www.perblue.com',
    :image_url => 'https://s3.amazonaws.com/imby_avatars/avatars/187/thumb.png'
  },
  {
    :name => 'Scott Resnick',
    :url => 'http://www.linkedin.com/pub/scott-resnick/9/29/471',
    :business => 'Hardin Design & Development',
    :business_url => 'http://www.hardindd.com/',
    :image_url => 'http://media02.linkedin.com/mpr/mpr/shrink_80_80/p/3/000/049/3df/3378150.jpg'
  },
  {
    :name => 'Greg Tracy',
    :url => 'http://www.gregtracy.com',
    :business => 'Sharendipity',
    :business_url => 'http://www.sharendipity.com',
    :image_url => 'http://pages.cs.wisc.edu/~gtracy/img/profile-pic.jpg'
  },
  {
    :name => 'Nathan Lustig',
    :url => 'http://www.nathanlustig.com',
    :business => 'Entrustet, Capital Entrepreneurs',
    :business_url => 'http://www.entrustet.com',
    :image_url => 'https://www.entrustet.com/images/Nathan_Lustig.gif'
  },
  {
    :name => 'Matt Peterson',
    :url => '',
    :business => 'SWI / Vertatique',
    :business_url => 'http://vertatique.com/',
    :image_url => 'http://www.vertatique.com/files/vert-logo-1-square.jpg'
  },
].sort {|a,b| a[:name].split(' ').last <=> b[:name].split(' ').last}.each do |cm|
  unless CabalMember.find_by_name cm[:name]
    CabalMember.create cm
  end
end
