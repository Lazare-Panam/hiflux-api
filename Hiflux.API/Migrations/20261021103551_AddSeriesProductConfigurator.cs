using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Hiflux.API.Migrations
{
    /// <inheritdoc />
    public partial class AddSeriesProductConfigurator : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    CategoryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    CatalogUrl = table.Column<string>(type: "nvarchar(2048)", maxLength: 2048, nullable: true),
                    CadUrl = table.Column<string>(type: "nvarchar(2048)", maxLength: 2048, nullable: true),
                    Description = table.Column<string>(type: "nvarchar(2000)", maxLength: 2000, nullable: true),
                    BodyMaterial = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    SeatMaterial = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    Design = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    TemperatureRange = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    Approvals = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    DatasheetUrl = table.Column<string>(type: "nvarchar(2048)", maxLength: 2048, nullable: true),
                    KeyFeatures = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CertificatesJson = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.CategoryId);
                });

            migrationBuilder.CreateTable(
                name: "Filters",
                columns: table => new
                {
                    FilterId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Filters", x => x.FilterId);
                });

            migrationBuilder.CreateTable(
                name: "CatalogProducts",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PartNumber = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    ProductStatus = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    FamilyDescription = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    DetailDescription = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(2048)", maxLength: 2048, nullable: true),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CatalogProducts", x => x.ProductId);
                    table.UniqueConstraint("AK_CatalogProducts_ProductId_CategoryId", x => new { x.ProductId, x.CategoryId });
                    table.ForeignKey(
                        name: "FK_CatalogProducts_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CategoryFilters",
                columns: table => new
                {
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    FilterId = table.Column<int>(type: "int", nullable: false),
                    SortOrder = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CategoryFilters", x => new { x.CategoryId, x.FilterId });
                    table.ForeignKey(
                        name: "FK_CategoryFilters_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CategoryFilters_Filters_FilterId",
                        column: x => x.FilterId,
                        principalTable: "Filters",
                        principalColumn: "FilterId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProductFilterValues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    FilterId = table.Column<int>(type: "int", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductFilterValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProductFilterValues_CatalogProducts_ProductId_CategoryId",
                        columns: x => new { x.ProductId, x.CategoryId },
                        principalTable: "CatalogProducts",
                        principalColumns: new[] { "ProductId", "CategoryId" },
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductFilterValues_CategoryFilters_CategoryId_FilterId",
                        columns: x => new { x.CategoryId, x.FilterId },
                        principalTable: "CategoryFilters",
                        principalColumns: new[] { "CategoryId", "FilterId" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductFilterValues_Filters_FilterId",
                        column: x => x.FilterId,
                        principalTable: "Filters",
                        principalColumn: "FilterId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CatalogProducts_CategoryId",
                table: "CatalogProducts",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_CatalogProducts_PartNumber",
                table: "CatalogProducts",
                column: "PartNumber",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Categories_Name",
                table: "Categories",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CategoryFilters_FilterId",
                table: "CategoryFilters",
                column: "FilterId");

            migrationBuilder.CreateIndex(
                name: "IX_Filters_Name",
                table: "Filters",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProductFilterValues_CategoryId_FilterId",
                table: "ProductFilterValues",
                columns: new[] { "CategoryId", "FilterId" });

            migrationBuilder.CreateIndex(
                name: "IX_ProductFilterValues_FilterId",
                table: "ProductFilterValues",
                column: "FilterId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductFilterValues_ProductId_CategoryId",
                table: "ProductFilterValues",
                columns: new[] { "ProductId", "CategoryId" });

            migrationBuilder.CreateIndex(
                name: "IX_ProductFilterValues_ProductId_FilterId_Value",
                table: "ProductFilterValues",
                columns: new[] { "ProductId", "FilterId", "Value" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductFilterValues");

            migrationBuilder.DropTable(
                name: "CatalogProducts");

            migrationBuilder.DropTable(
                name: "CategoryFilters");

            migrationBuilder.DropTable(
                name: "Categories");

            migrationBuilder.DropTable(
                name: "Filters");
        }
    }
}
