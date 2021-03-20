//
//  PostData.swift
//  H4X0R News
//
//  Created by Michael Chen on 12/29/20.
//

import Foundation

//so result is able to be decoded from Json
struct Results: Decodable {
    let hits: [Post]
}

//The fields in this need to match the same spelling as in the json
//Identifiable allow list to recognize order base on the id field when it is being looped
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}


/*
 !!!
 Need to add: App Transport Security Settings and set Allow Arbitrary Loads to yes in info.plist
 since some of the urls are http instead of https
 !!!
 
 Response from call to https://hn.algolia.com/api/v1/search?tags=front_page
 
 {
 "hits": [
    {
    "created_at": "2021-03-20T12:19:28.000Z",
    "title": "Demoscene accepted as UNESCO cultural heritage in Germany",
    "url": "http://demoscene-the-art-of-coding.net/2021/03/20/demoscene-accepted-as-unesco-cultural-heritage-in-germany/",
    "author": "quakeguy",
    "points": 706,
    "story_text": null,
    "comment_text": null,
    "num_comments": 94,
    "story_id": null,
    "story_title": null,
    "story_url": null,
    "parent_id": null,
    "created_at_i": 1616242768,
    "_tags": [4 items],
    "objectID": "26522681",
    "_highlightResult": {3 items}
 },
 {
    "created_at": "2021-03-20T09:06:58.000Z",
    "title": "The Invention of a New Pasta Shape",
    "url": "https://kottke.org/21/03/the-invention-of-a-new-pasta-shape",
    "author": "dgellow",
    "points": 274,
    "story_text": null,
    "comment_text": null,
    "num_comments": 102,
    "story_id": null,
    "story_title": null,
    "story_url": null,
    "parent_id": null,
    "created_at_i": 1616231218,
    "_tags": [4 items],
    "objectID": "26521761",
    "_highlightResult": {3 items}
 }
    ],
 "nbHits": 33,
 "page": 0,
 "nbPages": 2,
 "hitsPerPage": 20,
 "exhaustiveNbHits": true,
 "query": "",
 "params": "advancedSyntax=true&analytics=true&analyticsTags=backend&tags=front_page",
 "processingTimeMS": 1
 
 */
