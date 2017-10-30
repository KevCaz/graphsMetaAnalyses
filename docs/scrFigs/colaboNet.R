library(bibtex)

##-- We use 10 publications fron the Gravel's lab
refs <- read.bib("data/lab.bib")[1:10]

##-- Get authors and expand df as pair wise
authors <- lapply(refs, function(x) as.data.frame(t(combn(as.character(x[1]$author$family),2))))
authors <- do.call("rbind",authors)
names(authors) <- c("from","to")
authors <- as.data.frame(authors)

# Force columns' type
authors$to <- as.character(authors$to)
authors$from <- as.character(authors$from)
rownames(authors) <-  NULL

##-- Remove links fron one author to him-self
authors <- authors[which(authors$from != authors$to),]
authors$count <- 1
##
library(dplyr)
authors <- authors %>% group_by(G1 = pmin(from, to), G2 = pmax(from, to)) %>%
  summarise(Count = sum(count))

##-- Nodes and links as data.frames
nodes <- data.frame(labels=as.character(unique(c(authors$G1,authors$G2))))
nodes$id <- as.numeric(as.factor(nodes$labels))
edges <- data.frame(label_from=authors$G1,label_to=authors$G2)
##
edges_id <- merge(edges,nodes,by.x = "label_from", by.y = "labels", all.x=TRUE)
names(edges_id)[3] <- "from"
edges_id <- merge(edges_id,nodes,by.x = "label_to", by.y = "labels", all.x=TRUE)
names(edges_id)[4] <- "to"


##-- Create the network and save it
library(visNetwork)
nodes$shape <- "dot"
nodes$label <- as.character(nodes$labels) # Node label
visNetwork(nodes, edges_id, width="100%",height="800px") %>%
  visPhysics(stabilization = FALSE) %>%
  visSave(file = 'network.html')
