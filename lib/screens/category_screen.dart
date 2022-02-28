import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({this.category});


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar:AppBar(
        title: Text(widget.category.name),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                //boxShadow cria uma sombra envolta do container em que está
                boxShadow: [
                  BoxShadow(
                    //Cor co BoxShadow
                    color: Colors.black12,
                    //Define uma direção em que fica mais aparente a sombra
                    //seja na direita ou esquerda, baixo ou cima, pode ser usado
                    //valores negativos pois se trata de valor x e y
                    offset: Offset(0, 2),
                    //Dispersão da sombra, aumenta/diminue a sombra
                    //Só aceita valores >= 0
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: Text("\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount.toStringAsFixed(2)}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}