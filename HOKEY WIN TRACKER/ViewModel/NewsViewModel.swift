
struct NewsModel {
    let title: String
    let text: String
    let imageName: String
}
import Foundation

class NewsViewModel {
    
    private let newsArray: [NewsModel] = [
        NewsModel(title: "Sergey Shirokov's 1000th Game",
                  text: "Sergey Shirokov debuted in the top tier of Russian hockey in January 2005 and has since played exactly one thousand games.",
                  imageName: "news1"),
        
        NewsModel(title: "Nikitin on Averin: A Provocative Question.",
                  text: "— Considering the current season, would you think about bringing him back? — That's a provocative question. No comments, — he replied.",
                  imageName: "news2"),
        
        NewsModel(title: "Torpedo Extends Winning Streak to Five with a Shutout Against Kunlun",
                  text: "The teams played at the 'Nagorny' Stadium in Nizhny Novgorod. Torpedo secured a 4-0 victory (1-0, 1-0, 2-0).",
                  imageName: "news3"),
        
        NewsModel(title: "Guberniev: Thanks to Rotenberg, Hockey Has Become Even More Popular in the Country",
                  text: "The journalist praised SKA's head coach's progress and stated that his efforts are boosting the popularity of hockey in Russia.",
                  imageName: "news4"),
        
        NewsModel(title: "The 'Worst Result.'",
                  text: "The CSKA legend commented on the club's two losses with a combined score of 0-11.",
                  imageName: "news10"),
        
        NewsModel(title: "KHL Updates Its Playoffs Schedule",
                  text: "The Kontinental Hockey League expresses its condolences to the relatives and loved ones of the deceased and wishes a speedy recovery to all those affected.",
                  imageName: "news5"),
        
        NewsModel(title: "Metallurg Wins 4th Consecutive Match – 5-3 Against Dynamo",
                  text: "Metallurg secured its fourth consecutive victory in the Fonbet KHL Championship.",
                  imageName: "news6"),
        
        NewsModel(title: "Lokomotiv Cannot Be Called Ideal. The Club Has a Lot of Work Ahead",
                  text: "Lokomotiv is currently in first place in the standings, with Coach Nikitin's team losing only one match in regular time. It seems like a model for others.",
                  imageName: "news7"),
        
        NewsModel(title: "Sopin: Comtois Lacks 'Physicality' in Certain Areas",
                  text: "The sports director of Dynamo Moscow, Alexey Sopin, stated that Max Comtois needs to improve his physical condition to perform well this season.",
                  imageName: "news8"),
        
        NewsModel(title: "September Burned Out. And These Clubs Lit It Up",
                  text: "A disappointing start. Players we expected more from at the very beginning of the regular season.",
                  imageName: "news9"),
    ]

    init() {}
    
    public func getCountItems() -> Int {
        return newsArray.count
    }
    
    public func getNews(by id: Int) -> NewsModel? {
        if id >= 0 && id < newsArray.count {
            return newsArray[id]
        }
        
        return nil
    }
}



