import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // Assumindo que AppColors está em lib/theme/

// Importando os novos widgets da subpasta 'mapa'
// Se map_screen.dart estiver em 'lib/', o caminho é 'widgets/mapa/...'
import '../widgets/mapa/svg_icon_container.dart';
import '../widgets/mapa/filter_chip.dart';
import '../widgets/mapa/selectable_filter_card.dart';

// --------------------------------------------------------------------------
// 1. MODELO DE DADOS: Representa uma empresa de descarte (Mantido)
// --------------------------------------------------------------------------
class DisposalPoint {
  final String id;
  final String name;
  final String description;
  // Removida a dependência de LatLng. Usei um tipo dinâmico ou String como placeholder.
  final dynamic location; 
  final List<String> categories; 

  const DisposalPoint({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    this.categories = const [],
  });
}

// --------------------------------------------------------------------------
// NOVO MODELO: Detalhes dos Filtros (Mantido aqui, pois é usado em todo o arquivo)
// --------------------------------------------------------------------------
class FilterDetails {
  final String description;
  final String iconPath; 

  const FilterDetails({required this.description, required this.iconPath});
}

// --------------------------------------------------------------------------
// CLASSE PRINCIPAL: MAPSSCREEN (Refatorada)
// --------------------------------------------------------------------------
/// O MapsScreen é um componente placeholder que existe APENAS para ser
/// puxado/importado pela tela Home, sem conter nenhuma lógica de mapa.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Variáveis de Estado
  bool _isLoading = false; 
  bool _isSmartRecommendationActive = true;
  final List<String> _selectedFilters = ['Reciclagem', 'MarketPlace'];
  final List<String> _availableFilters = ['Reciclagem', 'Doação', 'MarketPlace', 'Reuso'];
  
  final Map<String, Color> _filterColors = {
    'Reciclagem': AppColors.secondary,
    'Doação': Colors.green.shade600,
    'MarketPlace': Colors.blue.shade600,
    'Reuso': Colors.orange.shade700,
  };

  final Map<String, FilterDetails> _filterDetails = {
    'Reciclagem': const FilterDetails(
      iconPath: 'assets/icons/reciclagem.svg', 
      description: 'Empresas especializadas na coleta, desmontagem, análise e reciclagem dos resíduos eletrônicos descartados', 
    ),
    'Doação': const FilterDetails(
      iconPath: 'assets/icons/doacao.svg', 
      description: 'Contribua com a educação e a sustentabilidade doando seus eletrônicos a projetos sociais e educacionais. Eles serão usados como insumos de aprendizado em comunidades e escolas.',
    ),
    'MarketPlace': const FilterDetails(
      iconPath: 'assets/icons/marketplace.svg', 
      description: 'Venda seus equipamentos ainda utilizáveis com segurança e confiança.',
    ),
    'Reuso': const FilterDetails(
      iconPath: 'assets/icons/reuso.svg', 
      description: 'Para quem quer doar equipamentos que ainda funcionam, mas que não tem mais utilidade pessoal. Aqui, eles são reparados e reutilizados.',
    ),
  };
  

  @override
  Widget build(BuildContext context) {
    
    // Mapeamento dos chips ativos usando o novo widget FilterChipWidget
    final activeFilterChips = _selectedFilters
        .where((name) => _filterDetails.containsKey(name))
        .map((name) {
          final color = _filterColors[name] ?? AppColors.secondary;
          final details = _filterDetails[name]!;
          return FilterChipWidget(
            key: ValueKey(name), // Usando ValueKey para ajudar o Flutter
            label: name, 
            iconPath: details.iconPath, 
            color: color, 
            onRemove: () {
              setState(() {
                _selectedFilters.remove(name);
                // TODO: Lógica de filtragem
              });
            },
          );
        })
        .toList();
    
    // Mapeamento dos cards de filtro usando o novo widget SelectableFilterCard
    final selectableFilterCards = _availableFilters
        .where((name) => _filterDetails.containsKey(name))
        .map((name) {
          final details = _filterDetails[name]!;
          final color = _filterColors[name] ?? AppColors.secondary;
          final isSelected = _selectedFilters.contains(name);

          return SelectableFilterCard(
            key: ValueKey(name), // Usando ValueKey para ajudar o Flutter
            filterName: name, 
            details: details, 
            color: color, 
            isSelected: isSelected, 
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedFilters.remove(name);
                } else {
                  _selectedFilters.add(name);
                }
                // TODO: Lógica de filtragem
              });
            },
          );
        })
        .toList();
    
    return Scaffold(
      body: Stack(
        children: [
          // FUNDO: MAPA VAZIO (Placeholder de Fundo)
          Positioned.fill(
            child: Container(
              color: Colors.grey[300], // Cor de fundo que simula o espaço do mapa
              child: _isLoading 
                  ? const Center(child: CircularProgressIndicator(color: AppColors.secondary))
                  : const Center(
                      child: Text(
                        'Espaço do Mapa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary
                        ),
                      ),
                    ),
            ),
          ),
          
          // ------------------------------------------------------------------
          // HEADER FIXO NO TOPO (Mantido)
          // ------------------------------------------------------------------
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea( 
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Encontre empresas",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 4,
                              offset: Offset(0, 1)
                            )
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // ------------------------------------------------------------------
          // CAIXA DE FILTROS ARRASTÁVEL (DraggableScrollableSheet - Mantido)
          // ------------------------------------------------------------------
          DraggableScrollableSheet(
            initialChildSize: 0.35, 
            minChildSize: 0.15, 
            maxChildSize: 0.90, 
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24), 
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black26,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Puxador (Handle)
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      
                      // Campo de busca (Header) - ATUALIZADO
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Digite o nome da empresa...",
                          hintStyle: const TextStyle(color: AppColors.textSecondary),
                          prefixIcon: const Icon(Icons.search, color: AppColors.secondary), // Corrigido para AppColors.secondary
                          
                          // NOVO ÍCONE: Marcador/Bandeira
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.bookmark, color: AppColors.secondary),
                            onPressed: () {
                              // TODO: Lógica para abrir filtros ou favoritos rápidos
                            },
                          ),

                          filled: true,
                          fillColor: Colors.grey[200], // Corrigido para um cinza mais claro (AppColors.background não estava definido, mas Colors.grey[200] simula a cor da imagem)
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Título Filtros
                      Text(
                        "Filtros",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      // Descrição com ícone (Usa o Widget importado)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SvgIconContainer( 
                            iconPath: 'assets/icons/home_search.svg', 
                            color: AppColors.secondary,
                            size: 20, 
                            padding: 8,
                            isActive: false, 
                            isSmartRecIcon: false, 
                            shouldApplyColorFilter: true,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text( 
                              "Arraste para cima e selecione os filtros para que possamos te ajudar da melhor forma a encontrar o tipo de descarte que você precisa.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),

                      // Recomendação inteligente
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSmartRecommendationActive = !_isSmartRecommendationActive;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgIconContainer( // Usa o Widget importado
                              iconPath: 'assets/icons/stars.svg', 
                              color: AppColors.secondary, 
                              size: 20, 
                              padding: 8,
                              isActive: _isSmartRecommendationActive, 
                              isSmartRecIcon: true,
                              shouldApplyColorFilter: true,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Ativar recomendação inteligente",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // ----------------------------------------------------
                      // SEÇÃO DE FILTROS SELECIONADOS (Chips)
                      // ----------------------------------------------------
                      if (activeFilterChips.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Selecionados",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold, 
                                color: AppColors.textPrimary
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectedFilters.clear();
                                });
                              },
                              child: const Text(
                                "Limpar Filtros",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Lista de Chips Ativos (Agora usa o mapeamento para o widget)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: activeFilterChips,
                        ),
                      ],

                      // ----------------------------------------------------
                      // CARTÕES DE FILTROS (Todas as 4 Categorias)
                      // ----------------------------------------------------
                      const SizedBox(height: 24),
                      
                      // Lista de Cartões Detalhados (Agora usa o mapeamento para o widget)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: selectableFilterCards,
                      ),
                      
                      const SizedBox(height: 32),
                      // Botão de Ação 
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Ação de filtro
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            "Aplicar Filtros",
                            style: TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
