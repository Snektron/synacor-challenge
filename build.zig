const std = @import("std");
const path = std.os.path;
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const vm = b.addExecutable("synacor-vm", "src/main.zig");
    vm.linkSystemLibrary("c");
    b.default_step.dependOn(&vm.step);

    const disas = b.addExecutable("disas", "src/disassemble.zig");
    const buildDisas = b.step("disas", "Build the disassembler");
    buildDisas.dependOn(&disas.step);

    const magic = b.addExecutable("magic", "src/magic.zig");
    const runMagic = b.step("magic", "Search for a solution of the magic function");
    const runMagicCmd = b.addCommand(".", b.env_map, [][]const u8{magic.getOutputPath()});

    runMagic.dependOn(&runMagicCmd.step);
    runMagicCmd.step.dependOn(&magic.step);

    const vault = b.addExecutable("vault", "src/vault.zig");
    const runVault = b.step("vault", "Search for a solution of the vault door");
    const runVaultCmd = b.addCommand(".", b.env_map, [][]const u8{vault.getOutputPath()});

    runVault.dependOn(&runVaultCmd.step);
    runVaultCmd.step.dependOn(&vault.step);
}