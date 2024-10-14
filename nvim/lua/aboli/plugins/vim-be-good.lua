local setup, VBG = pcall(require, "VimBeGood")
if not setup then
	return
end

VBG.g.nightflyTransparent = true
VBG.setup()
