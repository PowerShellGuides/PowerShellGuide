async function SearchGuide(term) {
    term = term.replace(/^\|\s{0,}/);
    var regexTerm = RegExp(term, 'i');
    var searchResult = await fetch('/guide.json')
    var guideContents = await searchResult.json();
    
    var searchResultsElement = document.getElementById("SearchResults");
    if (searchResultsElement == null) { return }

    for (guideItemIndex in guideContents) {
        guideItem = guideContents[guideItemIndex];
        if (guideItem.Name.match(regexTerm)) {            
            searchResultsElement.innerHTML += "<a href='/" + guideItem.Link + "'>" + guideItem.Name + "</a>";
            searchResultsElement.innerHTML += "<br/>";
        }        
    }
}
