#=============================================================================#
# ArrayAnalysis                                                               #
#                                                                             #
# Copyright 2010-2011 BiGCaT Bioinformatics                                   #
#                                                                             #
# Licensed under the Apache License, Version 2.0 (the "License");             #
# you may not use this file except in compliance with the License.            #
# You may obtain a copy of the License at                                     #
#                                                                             #
# http://www.apache.org/licenses/LICENSE-2.0                                  #
#                                                                             #
# Unless required by applicable law or agreed to in writing, software         #
# distributed under the License is distributed on an "AS IS" BASIS,           #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    #
# See the License for the specific language governing permissions and         #
# limitations under the License.                                              #
#=============================================================================#

# Called by Stat module 
getGroupsMats <-function(groups, bothWays=TRUE){
	groups<-unlist(strsplit(groups,"\n"))
	new<-levels(as.factor(groups[grep("[A-Za-z0-9]",groups)]))
	if(length(new)>=2){
		for(i in 1:(length(new)-1)){
			for(j in (i+1):length(new)){
				print(paste(new[i],"-",new[j],sep=""))
			}
		}
		if(bothWays){
			for(i in 1:(length(new)-1)){
				for(j in (i+1):length(new)){
					print(paste(new[j],"-",new[i],sep=""))
				}
			}
		}
		cat("[2]")
		for(i in 1:length(new)){
			print (new[i])
		}
	}
}

# Called by Stat module (tab delimited version of getGroupsMats)
getGroupsMatsTab <-function(groups, bothWays=TRUE){
	groups<-unlist(strsplit(groups,"\n"))
	new<-levels(as.factor(groups[grep("[A-Za-z0-9]",groups)]))
	if(length(new)>=2){
		for(i in 1:(length(new)-1)){
			for(j in (i+1):length(new)){
				print(paste("1\t",new[i],"\t-1\t",new[j],sep=""))
			}
		}
		if(bothWays){
			for(i in 1:(length(new)-1)){
				for(j in (i+1):length(new)){
					print(paste("1\t",new[j],"\t-1\t",new[i],sep=""))
				}
			}
		}
		cat("[2]")
		for(i in 1:length(new)){
			print (new[i])
		}
	}
}

# Called by Stat module (tab delimited version of getGroupsMats, creating a contrast matrix)
getGroupsMatsTab2 <-function(groups, bothWays=TRUE){
	groups<-unlist(strsplit(groups,"\n"))
	new<-levels(as.factor(groups[grep("[A-Za-z0-9]",groups)]))
	if(length(new)>=2){
    result <- matrix(nrow=(length(new)*(length(new)-1))/2,ncol=length(new),value=0)
    rowIndex <- 1
		for(i in 1:(length(new)-1)){
			for(j in (i+1):length(new)){
				result[rowIndex,i] <- 1
        result[rowIndex,j] <- -1
        rowIndex <- rowIndex+1
			}
		}
		if(bothWays){
			for(i in 1:(length(new)-1)){
				for(j in (i+1):length(new)){
				  result[rowIndex,i] <- -1
          result[rowIndex,j] <- 1
          rowIndex <- rowIndex+1
				}
			}
		}
		cat("[2]")
		for(i in 1:length(new)){
			print (new[i])
		}
	}
}

