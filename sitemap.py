BASE_URL = "https://shortercatechism.app/"


def gen_link(path):
    return f"<url><loc>{BASE_URL}{path}</loc></url>"


if __name__ == "__main__":
    # urls = [gen_link(x) for x in range(1, 108)]
    urls = []
    urls.append(gen_link("about"))
    urls.append(gen_link(""))
    urls = "\n".join(urls)

    sitemap = f"""<urlset
        xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    {urls}
    </urlset>"""

    with open("dist/sitemap.xml", "w") as f:
        f.write(sitemap)
