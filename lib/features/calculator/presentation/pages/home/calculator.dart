import 'package:calculator_ina17_test/features/calculator/cubit/input_cubit.dart';
import 'package:calculator_ina17_test/features/calculator/presentation/widgets/calculator_result_card.dart';
import 'package:flutter/material.dart';

enum StorageOption { fileStorage, databaseStorage }

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  StorageOption? _selectedOption = StorageOption.fileStorage; // default value

  List<List<String>> inputs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Calculator'),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildDisplay(context),
        _buildButtons(context),
        _buildStorage(context),
      ],
    );
  }

  _buildDisplay(BuildContext context) {
    return Expanded(
      child: inputs.isEmpty
          ? const Center(
              child: Text('No input yet'),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: List.generate(
                inputs.length,
                (index) => CalculatorResultCard(
                  input: inputs[index][0],
                  result: inputs[index][1],
                ),
              ),
            ),
    );
  }

  _buildButtons(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showBottomSheet(context),
      child: const Text('Add Input'),
    );
  }

  _buildStorage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        children: [
          RadioListTile<StorageOption>(
            title: const Text('Use file storage'),
            value: StorageOption.fileStorage,
            groupValue: _selectedOption,
            onChanged: (StorageOption? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<StorageOption>(
            title: const Text('Use database storage'),
            value: StorageOption.databaseStorage,
            groupValue: _selectedOption,
            onChanged: (StorageOption? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => context.read<InputCubit>().onPickImageCamera(),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              InkWell(
                onTap: () => context.read<InputCubit>().onPickImageGallery(),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    'Galeri',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
