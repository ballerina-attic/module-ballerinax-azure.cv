// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations

isolated function parseStringFromResponse(json result) returns string {
    json[] regions = <json[]> result.regions;
    string text = "";
    int regionCount = regions.length();
    int i = 0;
    while i < regionCount {
        json region = regions[i];
        i = i + 1;
        json[] lines = <json[]> region.lines;
        text = text + processMultipleLines(lines);
    }
    return text;
}

isolated function processMultipleLines(json[] lines) returns string {
    string text = "";
    int lineCount = lines.length();
    int j = 0;
    while j < lineCount {
        if j > 0 {
            text = text + "\n";
        }
        json line = lines[j];
        j = j + 1;
        json[] words = <json[]> line.words;
        text = text + processWordsInSameLine (words);
    }
    return text;
}

isolated function processWordsInSameLine(json[] words) returns string {
    string text = "";
    int wordCount = words.length();
    int k = 0;
    while k < wordCount {
        if k > 0 {
            text = text + " ";
        }
        text = text + <string> words[k].text;
        k = k + 1;
    }
    return text;
}
