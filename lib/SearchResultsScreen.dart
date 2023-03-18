import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<String> _searchResults;

  SearchResultsScreen(this._searchResults);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index]),
            onTap: () {
              // Navigate to the hospital details screen
            },
          );
        },
      ),
    );
  }
}
