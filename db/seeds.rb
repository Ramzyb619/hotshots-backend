require 'nokogiri'
require 'httparty'
require 'byebug'

# rmeove periods and replace spaces with -

atl = 'https://www.basketball-reference.com/pi/shareit/PJJVC'
bos = 'https://www.basketball-reference.com/pi/shareit/vO5id'
cha = 'https://www.basketball-reference.com/pi/shareit/9s2Ig'
chi = 'https://www.basketball-reference.com/pi/shareit/qnsdq'
cle = 'https://www.basketball-reference.com/pi/shareit/FBrMN'
dal = 'https://www.basketball-reference.com/pi/shareit/Igc9M'
den = 'https://www.basketball-reference.com/pi/shareit/cmEDt'
detr = 'https://www.basketball-reference.com/pi/shareit/nE6oV'
gsw = 'https://www.basketball-reference.com/pi/shareit/O40JG'
hou = 'https://www.basketball-reference.com/pi/shareit/MPFPd'
ind = 'https://www.basketball-reference.com/pi/shareit/8xz96'
lac = 'https://www.basketball-reference.com/pi/shareit/LrBBY'
lal = 'https://www.basketball-reference.com/pi/shareit/Y2ezQ'
mia = 'https://www.basketball-reference.com/pi/shareit/AHpP4'
mil = 'https://www.basketball-reference.com/pi/shareit/dayJW'
minn = 'https://www.basketball-reference.com/pi/shareit/LZW68'
njn = 'https://www.basketball-reference.com/pi/shareit/G8XnE'
nyk = 'https://www.basketball-reference.com/pi/shareit/C1QoW'
# orl = ''


team_urls = [
    atl, bos, cha, chi, cle, dal, den, detr, gsw, hou, ind, lac, lal, mia, mil, 
    minn, njn, nyk    
]


def scraper(url)

    # url = 'https://www.basketball-reference.com/teams/CHI/1991.html'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    tbody = parsed_page.at('tbody')
    row_index = 0
    team = [] # // team array of hashes
    while row_index < tbody.search('tr').count do 
        # start iterating thru rows
        player = {} # empty hash for player stats
        column_index = 0
        current_row = tbody.search('tr')[row_index]
            while column_index < current_row.search('td').count do
                # on each row iterate thru each column
                cell = current_row.search('td')[column_index]
                column_name = cell.attributes["data-stat"].text # get the data-stat name and use as a key
                player[column_name] = "" + cell
                column_index += 1
            end
        team << player
        row_index += 1
    end 
    
    team
    # byebug

end

def createPlayer(team_array, team_name)
    
    team_array.each do |singlePlayer| 
        free_throw_made = singlePlayer["ft"]
        free_throw_attempts = singlePlayer["fta"]
        free_throw_percentage = free_throw_made.to_i / free_throw_attempts.to_i
        
        img = singlePlayer["player"].split(' ').join('_').downcase

        Player.create(
            name: singlePlayer["player"],
            age: singlePlayer["age"],
            games_played: singlePlayer["g"],
            games_started: singlePlayer["gs"],
            minutes: singlePlayer["mp"],
            fg: singlePlayer["fg"],
            fga: singlePlayer["fga"],
            fgp: singlePlayer["fg_pct"],
            three_point_gpg: singlePlayer["fg3"],
            three_point_attempts: singlePlayer["fg3a"],
            three_point_percentage: singlePlayer["fg3_pct"],
            two_point_gpg: singlePlayer["fg2"],
            two_point_attempts: singlePlayer["fg2a"],
            two_point_percentage: singlePlayer["fg2_pct"],
            efg: singlePlayer["efg_pct"],
            ft: singlePlayer["ft"],
            fta: singlePlayer["fta"],
            ft_percentage: free_throw_percentage,
            orb: singlePlayer["orb"],
            drb: singlePlayer["drb"],
            trb: singlePlayer["trb"],
            ast: singlePlayer["ast"],
            steals: singlePlayer["stl"],
            blocks: singlePlayer["blk"],
            turnovers: singlePlayer["tov"],
            fouls: singlePlayer["pf"],
            ppg: singlePlayer["pts"],
            team: team_name,
            img_url: img.split('.').join('')
        )
        puts "created #{singlePlayer["player"]}"
    end 
end

atlanta = scraper(atl)
createPlayer(atlanta, "ATL")
boston = scraper(bos)
createPlayer(boston, "BOS")
charlotte = scraper(cha)
createPlayer(charlotte, "CHA")
chicago = scraper(chi)
createPlayer(chicago, "CHI")
cleveland = scraper(cle)
createPlayer(cleveland, "CLE")
dallas = scraper(dal)
createPlayer(dallas, "DAL")
denver = scraper(den)
createPlayer(denver, "DEN")
detroit = scraper(detr)
createPlayer(detroit, "DET")
goldenstate = scraper(gsw)
createPlayer(goldenstate, "GSW")
houston = scraper(hou)
createPlayer(houston, "HOU")
indiana = scraper(ind)
createPlayer(indiana, "IND")
clippers = scraper(lac)
createPlayer(clippers, "LAC")
lakers = scraper(lal)
createPlayer(lakers, "LAL")
miami = scraper(mia)
createPlayer(miami, "MIA")
milwauee = scraper(mil)
createPlayer(milwauee, "MIL")
minnesota = scraper(minn)
createPlayer(minnesota, "MIN")
newjersey = scraper(njn)
createPlayer(newjersey, "NJN")
newyork = scraper(nyk)
createPlayer(newyork, "NYK")
