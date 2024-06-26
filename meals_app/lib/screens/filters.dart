import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              return; 
            }
            ref.read(filtersProvider.notifier).setFilters({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _veganFilterSet,
              Filter.vegan: _veganFilterSet,
            });
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
                title: Text('Gluten-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include gluten-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
                },
                title: Text('Lactose-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include lactose-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                  });
                },
                title: Text('Vegetarian',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include vegetarian meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                  });
                },
                title: Text('Vegan',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Only include vegan meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              )
            ],
          ),
        ));
  }
}
